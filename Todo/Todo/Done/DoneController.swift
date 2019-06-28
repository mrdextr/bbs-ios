//
//  DoneController.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

class DoneController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emptyView: UIView!
    var donesis: [Todo]!
    let persistancy = PersistanceManager()
    
    var initial = true //
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Donesis" //
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always //
        self.navigationController?.navigationBar.prefersLargeTitles = true //
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.bbsBlue]
        
        self.imageView.image = UIImage(named: "Lazy")?.inTint(.bbsLightGrey) //
        self.descriptionLabel.textColor = .bbsLightGrey //
        self.descriptionLabel.text = "I am feeling lazy today!" //
        
        
        self.tableView.register(TodoCell.self) //
        self.tableView.tableFooterView = UIView() //
        self.tableView.delegate = self //
        self.tableView.dataSource = self //
        
        NotificationCenter.default.addObserver(forName: .reloadTodos, object: nil, queue: .main) { [weak self] _ in
            self?.refresh()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refresh()
        if !self.initial { //
            self.tableView.reloadData()
        } //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.initial { //
            self.tableView.reload(with: .up)
            self.initial = false //
        }
    }
    
    func refresh() {
        self.persistancy.load(done: true) { [weak self] donesis in
            self?.donesis = donesis
            
            if donesis.count > 0 {
                self?.emptyView.isHidden = true
            } else {
                self?.emptyView.isHidden = false
            }
        }
    }
}

