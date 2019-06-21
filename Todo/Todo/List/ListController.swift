//
//  ListController.swift
//  Todo
//
//  Created by Manuel Leibetseder on 20.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit
import FloatingPanel

class ListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emptyView: UIView!
    
    var todos: [Todo]!
    var panel: FloatingPanelController!
    let persistancy = PersistanceManager()
    var initial = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Todos"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.bbsBlue]
        
        self.tableView.register(TodoCell.self)
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.imageView.image = UIImage(named: "Finish")
        self.descriptionLabel.textColor = .bbsLightGrey
        self.descriptionLabel.text = "WOHOOO! No more Todos!"
        
        NotificationCenter.default.addObserver(forName: .reloadTodos, object: nil, queue: .main) { [weak self] _ in
            self?.refresh()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refresh()
        
        if !self.initial {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.initial {
            self.tableView.reload(with: .up)
            self.initial = false
        }
    }
    
    func refresh() {
        self.persistancy.load(done: false) { [weak self] todos in
            self?.todos = todos
            
        }
    }

}
