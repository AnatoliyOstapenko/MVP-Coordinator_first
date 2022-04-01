//
//  EmojiViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 01.04.2022.
//

import UIKit

class EmojiViewController: UIViewController {
    
    let emojiTableView = UITableView()
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiTableViewConfig()
        barButtonsConfigure()

        
    }
    
    func barButtonsConfigure() {
        //let editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editBarButtonPressed(sender:)))
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonPressed(sender:)))
        
        navigationItem.rightBarButtonItems = [addBarButton, self.editButtonItem]
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        
    
        
        let item = emojiTableView.isEditing == true ? false : true
        emojiTableView.isEditing = item
        
//        if emojiTableView.isEditing == true {
//            emojiTableView.isEditing = false
//
//
//        } else {
//            emojiTableView.isEditing = true
//            editButtonItem.isSelected = true
//        }
    }
    
    
    @objc func editBarButtonPressed(sender: Any?) {
        print("edit bar button pressed")
    }
    @objc func addBarButtonPressed(sender: Any?) {
        
    }
    
    func emojiTableViewConfig() {
        view.addSubview(emojiTableView)
        title = "Emoji"
        emojiTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellEmoji)
        emojiTableView.dataSource = self
        emojiTableView.frame = view.bounds
    }
    
    
}
// MARK:- DataSource
extension EmojiViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellEmoji, for: indexPath)
        cell.textLabel?.text = "Hello number \(indexPath.row)"
        return cell
    }
    
    
}
