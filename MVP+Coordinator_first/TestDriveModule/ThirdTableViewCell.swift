//
//  ThirdTableViewCell.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 03.04.2022.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    
    private let iconView = UIView()
    private let iconImageView = UIImageView()
    private let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setIconView()
        setIconImageView()
        setLabel()
        accessoryType = .disclosureIndicator
    }
    
    func setIconView() {
        contentView.clipsToBounds = true
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = 10
        iconView.layer.masksToBounds = true
        addSubview(iconView)
    }
    
    func setIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconView.addSubview(iconImageView)
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
    }
    
    func setLabel() {
        label.numberOfLines = 1
        addSubview(label)
    }
    
    func updateCell(with model: SettingsOption) {
        iconView.backgroundColor = model.iconBackgroundColor
        iconImageView.image = model.icon
        label.text = model.title
    }
    // Use it when frame goes from code
    override func layoutSubviews() {
        super.layoutSubviews()
        // iconView frame
        let size: CGFloat = contentView.frame.size.height - 12
        iconView.frame = CGRect(x: 10, y: 6, width: size, height: size)
        // label frame
        label.frame = CGRect(x: 25 + iconView.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 15 - iconView.frame.size.width - 10,
                             height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.backgroundColor = nil
        iconImageView.image = nil
        label.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
