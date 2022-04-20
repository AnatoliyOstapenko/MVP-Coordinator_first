//
//  EditViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 05.04.2022.
//

import UIKit

struct EditSection {
    var name: String
}

class EditViewController: UIViewController {
    
    private let cell = "currentCell"
    var array = [
        EditSection(name: "Title"),
        EditSection(name: "Image"),
        EditSection(name: "Description")
    ]
    var model = SecondModel(title: "", description: "", image: "", isFavorite: false)
    var editTableView = UITableView()
    var cancelBarButton = UIBarButtonItem()
    var saveBarButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavController()
        setEditTableView()
        setBarButtons()
    }
    
    func setBarButtons() {
        cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed(sender:)))
        saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePressed(sender:)))
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    @objc func cancelPressed(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func savePressed(sender: UIBarButtonItem) {
        
    }

    func configureNavController() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setEditTableView() {
        editTableView = UITableView(frame: view.bounds, style: .grouped) // fix frames and set grouped
        editTableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.imageCell)
        editTableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.descriptionCell)
        editTableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.titleCell)
        view.addSubview(editTableView)
        editTableView.dataSource = self
        editTableView.delegate = self
        title = "EDIT NEWS"
    }
    

}
// MARK: - TableView DataSource and Delegate
extension EditViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section].name
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.titleCell, for: indexPath) as! TitleTableViewCell
            return titleCell
        case 1:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.imageCell, for: indexPath) as! ImageTableViewCell
            imageCell.updateImageUI(label: "noImage")
            return imageCell
        default:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.descriptionCell, for: indexPath) as! DescriptionTableViewCell
            return descriptionCell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 40
        case 1:
            return 110
        default:
            return 200
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

