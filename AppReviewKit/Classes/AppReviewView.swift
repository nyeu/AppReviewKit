//
//  AppReviewView.swift
//  AppReviewKit
//
//  Created by Joan Cardona on 22/1/21.
//

import Foundation
import SnapKit
import UIKit

class AppReviewView: UIView {
    private let scrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    private let titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        l.numberOfLines = 0
        return l
    }()
    
    private let descriptionLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.preferredFont(forTextStyle: .headline)
        l.numberOfLines = 0
        return l
    }()
    
    private let buttonStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillEqually
        s.spacing = 15
        return s
    }()
    
    let positiveButton: UIButton = {
        let b = UIButton()
        b.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        b.setTitle("Yes", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    let negativeButton: UIButton = {
        let b = UIButton()
        b.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        b.setTitle("No", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    var buttons: [UIButton] {
        return [positiveButton,
                negativeButton]
    }
    
    var viewTitle: String? {
        didSet {
            titleLabel.text = viewTitle
        }
    }
    
    var viewDescription: String? {
        didSet {
            descriptionLabel.text = viewDescription
        }
    }
    
    var positiveAnswer: String = "Yes" {
        didSet {
            positiveButton.setTitle(positiveAnswer, for: .normal)
        }
    }
    
    var negativeAnswer: String = "No" {
        didSet {
            negativeButton.setTitle(negativeAnswer, for: .normal)
        }
    }
    
    var styleConfiguration: AppReviewStyleConfiguration {
        didSet {
            setStyle(styleConfiguration: styleConfiguration)
        }
    }
    
    init(styleConfiguration: AppReviewStyleConfiguration) {
        self.styleConfiguration = styleConfiguration
        super.init(frame: .zero)
        setupView()
        setStyle(styleConfiguration: styleConfiguration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(positiveButton)
        buttonStackView.addArrangedSubview(negativeButton)
                
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(80)
            make.height.equalTo(110)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func setStyle(styleConfiguration: AppReviewStyleConfiguration) {
        backgroundColor = styleConfiguration.backgroundColor
        titleLabel.textColor = styleConfiguration.titleColor
        descriptionLabel.textColor = styleConfiguration.descriptionColor
        positiveButton.setTitleColor(styleConfiguration.positiveButtonTitleColor, for: .normal)
        negativeButton.setTitleColor(styleConfiguration.negativeButtonTitleColor, for: .normal)
        
        buttons.forEach({
            $0.layer.cornerRadius = styleConfiguration.buttonsCornerRadius
            $0.layer.borderWidth = styleConfiguration.buttonsBorderWidth
            $0.layer.borderColor = styleConfiguration.buttonsBorderColor.cgColor
        })
    }
}
