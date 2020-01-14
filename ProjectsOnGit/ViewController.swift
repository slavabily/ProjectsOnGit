//
//  ViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 12/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let projects: [Project] = Bundle.main.decode(from: "projects.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Projects on Git"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.attributedText = project.attributedTitle
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

