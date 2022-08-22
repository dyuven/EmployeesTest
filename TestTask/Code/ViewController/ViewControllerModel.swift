//
//  ViewControllerModel.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import Foundation

enum ViewControllerModel {
  
  public enum MyError: String, PresentableError {
    func getLocalizedMessage() -> String {
      return self.rawValue
    }
    
    case urlError = "incorrect url"
  }

}
