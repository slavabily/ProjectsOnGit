//
//  ViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 12/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var projects = [Project]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Projects on Git"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let url = Bundle.main.url(forResource: "projects", withExtension: "json") else {
            fatalError("Failed to locate projects.json in app bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate projects.json in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedProjects = try? decoder.decode([Project].self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }
        projects = loadedProjects
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
        cell.textLabel?.attributedText = makeAttributedString(title: project.title, subtitle: project.subtitle)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        
        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
            NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: "\(subtitle)", attributes: subtitleAttributes)
        titleString.append(subtitleString)
        
        return titleString
    }


}

