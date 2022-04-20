//
//  EditPresenter.swift
//  MVP+Coordinator_first
//
//  Created by AnatoliiOstapenko on 08.04.2022.
//

import Foundation

protocol EditPresenterView: AnyObject {
    func setTitle(title: String?)
}

class EditPresenter {
    weak var view: EditPresenterView?
    
    
    func getTitle(title: String) {
        
    }
    
    
    
}
