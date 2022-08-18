//
//  EmployeeTableViewCell.swift
//  TestTask
//
//  Created by Вова Дю on 17.08.2022.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    return label.forAutolayout()
  }()
  
  lazy var phoneLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    return label.forAutolayout()
  }()
  
  lazy var skillsLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    return label.forAutolayout()
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupViews() {
    
    [nameLabel, phoneLabel, skillsLabel].forEach {
      contentView.addSubview($0)
    }
    

    nameLabel.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 24),
      
      phoneLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
      phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
      
      
      skillsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
      skillsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      skillsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      skillsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      
    ])
    
  }
  
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
