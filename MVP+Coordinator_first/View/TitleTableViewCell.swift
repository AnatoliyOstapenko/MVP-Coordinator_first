//
//  TitleTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 05.04.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let titleCell = "titleCell"
    var titleField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTitleTextField()
    }

    func setTitleTextField() {
        titleField.placeholder = "Type a brief title"
        contentView.addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleField.borderStyle = .roundedRect
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//// MARK: - TextField Delegate
//extension TitleTableViewCell: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(textField.text ?? "")
//        return true
//    }
//}
