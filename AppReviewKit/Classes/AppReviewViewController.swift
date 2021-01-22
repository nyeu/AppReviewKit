//
//  AppReviewViewController.swift
//  AppReviewKit
//
//  Created by Joan Cardona on 22/1/21.
//

import Foundation
import StoreKit
import SnapKit
import MessageUI

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
    
    public var includeAppBuildNumber: Bool = true
    
    // If nil, we don't show send email to user
    private let feedbackEmail: String?
    
    public init(reviewTitle: String,
                reviewDescription: String,
                feedbackEmail: String?,
                styleConfiguration: AppReviewStyleConfiguration?) {
        reviewView = AppReviewView(styleConfiguration: styleConfiguration ?? AppReviewStyleConfiguration())
        self.reviewTitle = reviewTitle
        self.reviewDescription = reviewDescription
        self.feedbackEmail = feedbackEmail
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
        guard let email = feedbackEmail else {
            delegate?.replied(positively: false)
            dismiss(animated: true, completion: nil)
            return
        }
        sendEmail(recipientEmail: email)
    }
}

extension AppReviewViewController: MFMailComposeViewControllerDelegate {
    func sendEmail(recipientEmail: String) {
        let mailComposeViewController = configuredMailComposeViewController(recipientEmail: recipientEmail)
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }

    func configuredMailComposeViewController(recipientEmail: String) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Uknown"
        mailComposerVC.setToRecipients([recipientEmail])
        mailComposerVC.setSubject("Contact Us")
        let messageBody =  "Hello!" + "\n\n" + (includeAppBuildNumber ? "App version: \(appVersion)" : "")
        mailComposerVC.setMessageBody(messageBody, isHTML: false)

        return mailComposerVC
    }

    func showSendMailErrorAlert() {
        let emailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        emailErrorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(emailErrorAlert, animated: true, completion: nil)
    }

    // MARK: MFMailComposeViewControllerDelegate Method
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        delegate?.replied(positively: false)
        controller.dismiss(animated: true) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
