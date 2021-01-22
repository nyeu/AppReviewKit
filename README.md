# AppReviewKit

[![CI Status](https://img.shields.io/travis/nyeu/AppReviewKit.svg?style=flat)](https://travis-ci.org/nyeu/AppReviewKit)
[![Version](https://img.shields.io/cocoapods/v/AppReviewKit.svg?style=flat)](https://cocoapods.org/pods/AppReviewKit)
[![License](https://img.shields.io/cocoapods/l/AppReviewKit.svg?style=flat)](https://cocoapods.org/pods/AppReviewKit)
[![Platform](https://img.shields.io/cocoapods/p/AppReviewKit.svg?style=flat)](https://cocoapods.org/pods/AppReviewKit)

## Intro

AppReviewKit helps you gain more positive and meaninful app reviews by making sure only users with a good experience are shown the system review. It also helps you gather feedback on what to improve by asking those users that are not happy with how the app behaves to send you an email with improvements.

## Installation

AppReviewKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppReviewKit'
```

## Requirements

- iOS 13.0
- Swift 5.0+


## How to use it

AppReviewKit is a very simple library that requires very little configuration. You can just launch it by creating a `AppReviewViewController` and present it wherever you want.
```
let reviewKit = AppReviewViewController(reviewTitle: "Do you like Mindful Affirmations?",
                                        reviewDescription: "It would help us a lot knowing your opinion",
                                        feedbackEmail: "joancardon@gmail.com",
                                        styleConfiguration: nil)
present(reviewKit, animated: true, completion: nil)

```
If you want to customize it you can create an instance of `AppReviewStyleConfiguration` and fill it with the values that you prefer and pass it to your `AppReviewViewController`. For example:

```
let styleConfiguration = AppReviewStyleConfiguration(backgroundColor: .white,
                                                     titleColor: .black,
                                                     descriptionColor: .gray)
                                                     
```

If when you create `AppReviewViewController` you include a valid email in the field `feedbackEmail`, if the user replies negatively they will see a prompt to send you an email with feedback. If `feedbackEmail` is nil, it will just close `AppReviewViewController`. By default `AppReviewKit` will send the version number of the app in every feedback email, you can disable it setting `includeAppBuildNumber` to `false`:
`reviewKit.includeAppBuildNumber = false`

In both cases, `AppReviewViewControllerDelegate`  will be called on the action if it has been properly set up.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Hi! I am Joan Cardona, the author of this library.
I am an indie iOS developer and I found myself constantly creating this little screen to ask for reviews. I noticed that this improved my rating score and also the percentage of users reviewing my apps. I hope this helps you too.

Joan Cardona, joancardona@gmail.com


## License

AppReviewKit is available under the MIT license. See the LICENSE file for more info.
