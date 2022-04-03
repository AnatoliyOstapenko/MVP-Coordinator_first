//
//  ThirdViewController.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 03.04.2022.
//

import UIKit


struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct Section {
    let title: String
    let options: [SettingsOption]
}

class ThirdViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var models: [Section] = []
    var thirdTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setThirdTableView()
        configure()
    }
    
    func configure() {
        models.append(Section(title: "First Section", options: [
            SettingsOption(title: "first", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "second", icon: UIImage(systemName: "applelogo"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "first", icon: UIImage(systemName: "graduationcap.circle"), iconBackgroundColor: .systemPink, handler: {
                
            })
        
        
        ]))
        models.append(Section(title: "Second Section", options: [
            SettingsOption(title: "first", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "second", icon: UIImage(systemName: "applelogo"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "first", icon: UIImage(systemName: "graduationcap.circle"), iconBackgroundColor: .systemPink, handler: {
                
            })
        
        
        ]))
        models.append(Section(title: "Third Section", options: [
            SettingsOption(title: "first", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "second", icon: UIImage(systemName: "applelogo"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "first", icon: UIImage(systemName: "graduationcap.circle"), iconBackgroundColor: .systemPink, handler: {
                
            })
        
        
        ]))
        models.append(Section(title: "Four Section", options: [
            SettingsOption(title: "first", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "second", icon: UIImage(systemName: "applelogo"), iconBackgroundColor: .systemPink, handler: {
                
            }),
            SettingsOption(title: "first", icon: UIImage(systemName: "graduationcap.circle"), iconBackgroundColor: .systemPink, handler: {
                
            })
        
        
        ]))
    }
    
    func setThirdTableView() {
        title = "Write your news"
        thirdTableView = UITableView(frame: .zero, style: .grouped) //grouped design
        thirdTableView.register(ThirdTableViewCell.self, forCellReuseIdentifier: Constants.thirdCell)
        view.addSubview(thirdTableView)
        thirdTableView.dataSource = self
        thirdTableView.delegate = self
        thirdTableView.frame = view.bounds
    }

}
// MARK: - DataSource
extension ThirdViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.thirdCell, for: indexPath) as! ThirdTableViewCell
        cell.updateCell(with: models[indexPath.section].options[indexPath.row])
        return cell
    }
}
// MARK: - TableView Delegate
extension ThirdViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
