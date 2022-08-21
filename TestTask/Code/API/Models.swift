//
//  Models.swift
//  TestTask
//
//  Created by Вова Дю on 18.08.2022.
//

import Foundation

struct Response: Codable {
  let company: Company
}

struct Company: Codable {
  let name: String
  let employees: [Employee]
}

struct Employee: Codable {
  let name: String
  let phone_number: String
  let skills: [String]
}


