//
//  ViewControllerInteractor.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import Foundation
import UIKit

protocol UIViewControllerBusinessLogic {
  func getEmployees()
}

final class ViewControllerInteractor: UIViewControllerBusinessLogic {
  
  var presenter: UIViewControllerPresentLogic?
  
  func getEmployees() {
    Service.shared.getAvitoEmployees { [weak self] response, error in
     
      if let error = error {
        self?.presenter?.presentError(error: error)
        return
      }
      
      guard let response = response else {
        return
      }
        self?.presenter?.presentEmployees(employees: response.company.employees)
      
    }
  }
  
  
}
