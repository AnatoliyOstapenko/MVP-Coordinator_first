//
//  DescriptionTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 05.04.2022.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let descriptionCell = "descriptionCell"
    let descriptionTextView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDescriptionTextView()
    }
    
    func setDescriptionTextView() {
        descriptionTextView.text = "Don't wast your time, start typing...."
        descriptionTextView.font = .systemFont(ofSize: 18, weight: .thin)
        contentView.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
