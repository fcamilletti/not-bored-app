//
//  ViewController.swift
//  Not Bored
//
//  Created by Franco Camilletti on 08/09/2022.
//

import UIKit

class ActivitiesViewController: UIViewController {

    private lazy var activitiesTableView : UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.backgroundColor = .color_background_app
        aTable.register(ActivityTableViewCell.self, forCellReuseIdentifier: ActivityTableViewCell.identifier)
        aTable.delegate = self
        aTable.dataSource = self
        aTable.separatorStyle = .none

        return aTable
    }()
    
    private let HEIGHT_ROW = 80.0
    private var viewModel = ActivityViewModel(service: ActivityService.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraint()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Activities"
    }
    
    private func setupView(){
        
        viewModel.getActivities()
        
        view.backgroundColor = .blue
        
        view.addSubview(activitiesTableView)
        
    }
    
    private func setupConstraint(){
        
        NSLayoutConstraint.activate([
            activitiesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activitiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activitiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activitiesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ActivitiesViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        cell.configCell(text: viewModel.activities[indexPath.row].description )
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        HEIGHT_ROW
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = SuggestionsViewController(type: viewModel.activities[indexPath.row].description)
        
        navigationController?.pushViewController(view, animated: true)
    }
}
