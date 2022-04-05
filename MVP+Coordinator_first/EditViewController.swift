//
//  EditViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 05.04.2022.
//

import UIKit

class EditViewController: UIViewController {
    var object = [
        SecondModel(title: "First tittle", description: "It's desciption for title", image: "bonjour", isFavorite: false),
        SecondModel(title: "Second tittle", description: "It's desciption for title", image: "applelogo", isFavorite: false),
        SecondModel(title: "Third tittle", description: "It's desciption for title", image: "arrowtriangle.down.square.fill", isFavorite: false)
    ]
    
    var editTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setEditTableView()
    }
    
    func setEditTableView() {
        editTableView = UITableView(frame: view.bounds, style: .grouped) // fix frames and set grouped
        editTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.newsCell)
        view.addSubview(editTableView)
        editTableView.dataSource = self
        //editTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        title = "Edit News"
    }
    

}
extension EditViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section #\(section)"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath) as! NewsTableViewCell
        cell.updateSecondVC(view: object[indexPath.row])
        return cell
    }
    
    
}
