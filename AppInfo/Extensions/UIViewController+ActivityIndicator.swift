//
//  UIViewController+ActivityIndicator.swift
//  GetBlogger
//
//  Created by Nikita Sadovskij on 26.04.2018.
//  Copyright © 2018 Fingers Media. All rights reserved.
//

import UIKit

import NVActivityIndicatorView

extension UIViewController {

    func showLoadingIndicatorView() {
        let activityData = ActivityData(
            size: nil,
            message: nil,
            messageFont: nil,
            messageSpacing: nil,
            type: .circleStrokeSpin,
            color: UIColor.mainPink(),
            padding: nil,
            displayTimeThreshold: nil,
            minimumDisplayTime: nil,
            backgroundColor: UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5), textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData) { (_) in
        }
    }

    func hideLoadingIndicatorView() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating { (indicatorView, _) in
            indicatorView.isHidden = true
        }
    }
}
