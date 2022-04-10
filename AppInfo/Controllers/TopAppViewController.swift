//
//  TopAppViewController.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

class TopAppViewController: UIViewController {
    
    @IBOutlet weak var tabeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        tabeView.register(TopAppTableViewCell.self)
    }
}

extension TopAppViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TopAppTableViewCell.self, for: indexPath)
        
        return cell ?? UITableViewCell()
    }
}

extension TopAppViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
