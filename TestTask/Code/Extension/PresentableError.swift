//
//  PresentableError.swift
//  TestTask
//
//  Created by Вова Дю on 20.08.2022.
//

import Foundation

protocol PresentableError: Error {
  func getLocalizedMessage() -> String
}

extension Error {
  var presentable: PresentableError? {
    return self as? PresentableError
  }

  // TODO: Add AWS errors
  /// Returns localized user-friendly message
  var localizedMessage: String {
    return presentable?.getLocalizedMessage() // PresentableError
    ?? localizedDescription // Default localized description
  }
}
