//
//  EmojiViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 01.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let secondTableView = UITableView()
    var object = [
        SecondModel(title: "First tittle", description: "It's desciption for title", image: "bonjour", isFavorite: false),
        SecondModel(title: "Second tittle", description: "It's desciption for title", image: "applelogo", isFavorite: false),
        SecondModel(title: "Third tittle", description: "It's desciption for title", image: "arrowtriangle.down.square.fill", isFavorite: false)
    ]
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setSecondTableView()
        setBarButtons()
    }
    
    func setBarButtons() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonPressed(sender:)))
        navigationItem.rightBarButtonItems = [addBarButton, editButtonItem]
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if secondTableView.isEditing {
            secondTableView.isEditing = false
        } else {
            secondTableView.isEditing = true
        }
    }

    
    @objc func addBarButtonPressed(sender: Any?) {
        
    }
    
    func setSecondTableView() {
        view.addSubview(secondTableView)
        title = "Emoji"
        secondTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.newsCell)
        secondTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.frame = view.bounds
    }
    
    
    
    
}
// MARK: - TableView DataSource
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath) as! NewsTableViewCell
        cell.updateSecondVC(view: object[indexPath.row])
        return cell
    }
}
// MARK: - TableView Delegate
extension SecondViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//
//    }
    
  // MARK: - Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            object.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }
    // MARK: - Move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = object.remove(at: sourceIndexPath.row)
        object.insert(moved, at: destinationIndexPath.row)
        secondTableView.reloadData()
    }
    // MARK: - Swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // done action:
        func done(at indexPath: IndexPath) -> UIContextualAction {
            let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
                self.object.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            action.image = UIImage(systemName: "trash.circle")
            action.backgroundColor = .systemPink
            return action
        }
        let done = done(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    
    
    
}
