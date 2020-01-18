//
//  DetailViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 13/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var project: Project!
    
    override func loadView() {
        view = DetailView(project: project, readActon: readProject)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        assert(project != nil, "You must set a project before show this view contrller.")
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.title)"
    }
    
     func readProject() {
        coordinator?.read(project)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
