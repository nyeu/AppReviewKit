//
//  AppReviewViewController.swift
//  AppReviewKit
//
//  Created by Joan Cardona on 22/1/21.
//

import Foundation
import StoreKit
import SnapKit

public protocol AppReviewViewControllerDelegate: class {
    func replied(positively: Bool)
}

public class AppReviewViewController: UIViewController {
    public weak var delegate: AppReviewViewControllerDelegate?
    let reviewView: AppReviewView
    
    public var reviewTitle: String {
        didSet {
            reviewView.viewTitle = reviewTitle
        }
    }
    public var reviewDescription: String {
        didSet {
            reviewView.viewDescription = reviewDescription
        }
    }
    
    public var positiveAnswer: String = "Yes" {
        didSet {
            reviewView.positiveAnswer = positiveAnswer
        }
    }
    
    public var negativeAnswer: String = "No" {
        didSet {
            reviewView.negativeAnswer = negativeAnswer
        }
    }
    
    public init(reviewTitle: String, reviewDescription: String, styleConfiguration: AppReviewStyleConfiguration?) {
        reviewView = AppReviewView(styleConfiguration: styleConfiguration ?? AppReviewStyleConfiguration())
        self.reviewTitle = reviewTitle
        self.reviewDescription = reviewDescription
        super.init(nibName: nil, bundle: nil)
        reviewView.viewTitle = reviewTitle
        reviewView.viewDescription = reviewDescription
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    
    private func setupView() {
        view.addSubview(reviewView)
        reviewView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        reviewView.positiveButton.addTarget(self, action: #selector(positiveAnswerTapped), for: .touchUpInside)
        reviewView.negativeButton.addTarget(self, action: #selector(negativeAnswerTapped), for: .touchUpInside)
    }
    
    @objc private func positiveAnswerTapped() {
        delegate?.replied(positively: true)
        dismiss(animated: true) {
            SKStoreReviewController.requestReview()
        }
    }
    
    @objc private func negativeAnswerTapped() {
        delegate?.replied(positively: false)
        dismiss(animated: true, completion: nil)
    }
}
