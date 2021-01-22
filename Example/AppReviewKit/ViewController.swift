//
//  ViewController.swift
//  AppReviewKit
//
//  Created by nyeu on 01/22/2021.
//  Copyright (c) 2021 nyeu. All rights reserved.
//

import UIKit
import AppReviewKit

class ViewController: UIViewController {
    let button: UIButton = {
        let b = UIButton()
        b.setTitle("Touch To Ask for Review", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview().offset(-50)
        }
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        openReviewKit()
    }
    
    func openReviewKit() {
        let styleConfiguration = AppReviewStyleConfiguration(backgroundColor: .white,
                                                             titleColor: .black,
                                                             descriptionColor: .gray)
        
        let reviewKit = AppReviewViewController(reviewTitle: "Do you like Mindful Affirmations?",
                                                reviewDescription: "It would help us a lot knowing your opinion",
                                                feedbackEmail: "joancardon@gmail.com",
                                                styleConfiguration: nil)
        reviewKit.includeAppBuildNumber = false
        present(reviewKit, animated: true, completion: nil)
    }
}

