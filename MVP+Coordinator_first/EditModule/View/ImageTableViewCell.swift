//
//  EditTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 05.04.2022.
//

import UIKit



class ImageTableViewCell: UITableViewCell {
    
    static let imageCell = "editCell"
    var editImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImageView()
    }
    
    func updateImageUI(label: String) {
        editImageView.image = UIImage(named: label)
    }
    
    func setImageView() {
        editImageView.clipsToBounds = true
        editImageView.contentMode = .scaleAspectFit
        contentView.addSubview(editImageView)
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        editImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        editImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        editImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        editImageView.widthAnchor.constraint(equalTo: editImageView.heightAnchor, multiplier: 3/2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
