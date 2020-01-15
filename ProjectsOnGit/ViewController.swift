//
//  ViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 12/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
    
    let dataSource = ProjectDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
 
        title = "Projects on Git"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = dataSource.project(at: indexPath.row)
        
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

