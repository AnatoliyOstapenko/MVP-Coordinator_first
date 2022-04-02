//
//  EmojiViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 01.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let emojiTableView = UITableView()
    let object = [
        SecondModel(title: "First tittle", description: "It's desciption for title", image: "bonjour", isFavorite: false),
        SecondModel(title: "Second tittle", description: "It's desciption for title", image: "applelogo", isFavorite: false),
        SecondModel(title: "Third tittle", description: "It's desciption for title", image: "arrowtriangle.down.square.fill", isFavorite: false)
    ]
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiTableViewConfig()
        barButtonsConfigure()
    }
    
    func barButtonsConfigure() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonPressed(sender:)))
        navigationItem.rightBarButtonItems = [addBarButton, self.editButtonItem]
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if emojiTableView.isEditing == true {
            emojiTableView.isEditing = false
            editButtonItem.isSelected = false
        } else {
            emojiTableView.isEditing = true
            editButtonItem.isSelected = true
        }
    }
    
    @objc func addBarButtonPressed(sender: Any?) {
        
    }
    
    func emojiTableViewConfig() {
        view.addSubview(emojiTableView)
        title = "Emoji"
        emojiTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.newsCell)
        emojiTableView.dataSource = self
        emojiTableView.frame = view.bounds
    }
    
    
}
// MARK:- DataSource
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath) as! NewsTableViewCell
        cell.newsImageView.contentMode = .scaleAspectFit
        cell.updateSecondVC(view: object[indexPath.row])
        return cell
    }
    
    
}
