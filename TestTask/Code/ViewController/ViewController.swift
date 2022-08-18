//
//  ViewController.swift
//  TestTask
//
//  Created by Вова Дю on 16.08.2022.
//

import UIKit

protocol ViewControllerDisplayLogic: AnyObject {

}

class ViewController: UIViewController, ViewControllerDisplayLogic {
  
  // MARK: - Setup views
  private lazy var mainLabel: UILabel = {
    let label = UILabel()
    label.text = "Список"
    label.textAlignment = .center
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    return label
  }()
  
  private lazy var employeesTable: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.dataSource = self
    table.delegate = self
    table.isScrollEnabled = true
    table.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
    return table
  }()
  
  
  
  var interactor: UIViewControllerBusinessLogic?

  // MARK: - Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  var tempData = [ViewControllerModel.Employee(name: "John", phone: "12345", skills: ["swift", "xcode"]),
                  ViewControllerModel.Employee(name: "Diego", phone: "123123", skills: ["kotlin", "java"]),
                  ViewControllerModel.Employee(name: "Alfred", phone: "66666", skills: ["photoshop", "adobe"])
  ].sorted { $0.name > $1.name }
  
  // MARK: - Setup
  
  private func setup() {
    let viewController = self
    let interactor = ViewControllerInteractor()
    let presenter = ViewControllerPresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
    }

  
  private func setupViews() {
 //   showLoadingIndicator(onView: view)
    view.backgroundColor = .white
    employeesTable.estimatedRowHeight = 60
    employeesTable.rowHeight = UITableView.automaticDimension
    [mainLabel, employeesTable].forEach {
      view.addSubview($0.forAutolayout())
    }
    
    NSLayoutConstraint.activate([
      mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
      mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      mainLabel.heightAnchor.constraint(equalToConstant: 20),
      
      
      employeesTable.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
      employeesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      employeesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      employeesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      
    ])
  }

}


extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tempData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
    cell.nameLabel.text = "name: " + tempData[indexPath.row].name
    cell.phoneLabel.text = "phone: " + tempData[indexPath.row].phone
    cell.skillsLabel.text = "skills: " + tempData[indexPath.row].skills.joined(separator: ", ")
    return cell
  }
  
  
}

extension ViewController: UITableViewDelegate {
  
}
