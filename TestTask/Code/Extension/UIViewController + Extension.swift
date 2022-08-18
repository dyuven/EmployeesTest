//
//  UIViewController + Extension.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import Foundation
import UIKit

var loadingIndicator: UIView?

extension UIViewController {
  
  func showLoadingIndicator(onView: UIView) {
    guard loadingIndicator == nil else {
      return
    }
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
    let ai = UIActivityIndicatorView.init(style: .large)
    ai.startAnimating()
    ai.center = spinnerView.center
    spinnerView.alpha = 0.0
    spinnerView.addSubview(ai)
    onView.addSubview(spinnerView)
    loadingIndicator = spinnerView
    UIView.animate(
      withDuration: 0.2,
      animations: {
        spinnerView.alpha = 1.0
      }
    )
  }
  
  func removeLoadingIndicator() {
    UIView.animate(
      withDuration: 0.2,
      animations: {
        loadingIndicator?.alpha = 0.0
      },
      completion: { _ in
        loadingIndicator?.removeFromSuperview()
        loadingIndicator = nil
      }
    )
  }
}
