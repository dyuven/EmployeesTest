//
//  ViewControllerPresenter.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import Foundation

protocol UIViewControllerPresentLogic {
  func presentEmployees(employees: [Employee])
  func presentError(error: Error)
}

final class ViewControllerPresenter: UIViewControllerPresentLogic {
  
  weak var viewController: ViewControllerDisplayLogic?

  func presentEmployees(employees: [Employee]) {
    DispatchQueue.main.async {
      self.viewController?.displayEmployees(employees: employees)
    }
  }
  
  func presentError(error: Error) {
    DispatchQueue.main.async {
      self.viewController?.displayError(error: error)
    }
  }
  
}
