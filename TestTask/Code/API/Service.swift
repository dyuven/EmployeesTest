//
//  Service.swift
//  TestTask
//
//  Created by Вова Дю on 18.08.2022.
//

import Foundation

protocol ServiceType {
  func getAvitoEmployees(completion: @escaping (Response?, Error?) -> Void)
}

final class Service: ServiceType {
  
  // single ton
  static let shared = Service()
  
  private init() {}
  
  private let urlSession = URLSession.shared
  
  func getAvitoEmployees(completion: @escaping (Response?, Error?) -> Void) {
    guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else {
      completion(nil, ViewControllerModel.MyError.urlError)
      return
    }
    urlSession.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(nil, error)
        return
      }
      
      guard let data = data else {
        return
      }
      do {
        let employees = try JSONDecoder().decode(Response.self, from: data)
          completion(employees, nil)
      } catch {
        print(error)
      }

    }.resume()
  }
  
}






