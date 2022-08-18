//
//  UIView + Extension.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import Foundation
import UIKit

extension UIView {
  func forAutolayout() -> Self {
    self.translatesAutoresizingMaskIntoConstraints = false
    return self
  }
}
