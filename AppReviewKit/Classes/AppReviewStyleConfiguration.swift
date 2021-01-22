//
//  AppReviewStyleConfiguration.swift
//  AppReviewKit
//
//  Created by Joan Cardona on 22/1/21.
//

import Foundation

public struct AppReviewStyleConfiguration {
    let backgroundColor: UIColor
    let titleColor: UIColor
    let descriptionColor: UIColor
    let positiveButtonTitleColor: UIColor
    let negativeButtonTitleColor: UIColor
    let buttonsCornerRadius: CGFloat
    let buttonsBorderWidth: CGFloat
    let buttonsBorderColor: UIColor
    
    public init(backgroundColor: UIColor = .white,
         titleColor: UIColor = .black,
         descriptionColor: UIColor = .black,
         positiveButtonTitleColor: UIColor = .black,
         negativeButtonTitleColor: UIColor = .black,
         buttonsCornerRadius: CGFloat = 10.0,
         buttonsBorderWidth: CGFloat = 2.0,
         buttonsBorderColor: UIColor = UIColor.black) {
        
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.positiveButtonTitleColor = positiveButtonTitleColor
        self.negativeButtonTitleColor = negativeButtonTitleColor
        self.buttonsCornerRadius = buttonsCornerRadius
        self.buttonsBorderWidth = buttonsBorderWidth
        self.buttonsBorderColor = buttonsBorderColor
    }
}
