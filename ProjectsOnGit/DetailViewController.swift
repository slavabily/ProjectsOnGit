//
//  DetailViewController.swift
//  ProjectsOnGit
//
//  Created by slava bily on 13/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var project: Project!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        assert(project != nil, "You must set a project before show this view contrller.")
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.title)"
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.numberOfLines = 0
        titleLabel.text = project.title
        
        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = .preferredFont(forTextStyle: .body)
        detailLabel.numberOfLines = 0
        detailLabel.text = project.subtitle
        
        let showButton = UIButton(type: .system)
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.setTitle("Start Reading", for: .normal)
        showButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        showButton.addTarget(self, action: #selector(readProject), for: .touchUpInside)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.addArrangedSubview(showButton)
        stackView.setCustomSpacing(40, after: detailLabel)
    }
    
    @objc func readProject() {
        guard let readVC = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController else { return }
        
        readVC.project = project
        navigationController?.pushViewController(readVC, animated: true)
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
