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

    
    @objc func addBarButtonPressed(sender: UIBarButtonItem?) {
        
        coordinator?.goToThirdVC(sender: sender, viewController: self)
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
        // delete action:
        let delete: UIContextualAction = {
            let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
                self.object.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            action.image = UIImage(systemName: "trash.circle")
            action.backgroundColor = .systemPink
            return action
        }()
        // done action
        let done: UIContextualAction = {
            var array = object[indexPath.row]
            let action = UIContextualAction(style: .normal, title: nil) { action, view, completion in
                array.isFavorite = !array.isFavorite //change bool value
                self.object[indexPath.row] = array
                completion(true)
            }
            switch object[indexPath.row].isFavorite {
            case true:
                action.backgroundColor = .systemMint
                action.image = UIImage(systemName: "checkmark.circle")
                action.title = "Done"
            case false:
                action.backgroundColor = .systemGray
                action.image = UIImage(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                action.title = "Not Done \n Yet"
            }
            return action
        }()
        return UISwipeActionsConfiguration(actions: [delete, done])
    }
}
