//
//  SuggestionsViewController.swift
//  Not Bored
//
//  Created by Franco Camilletti on 08/09/2022.
//

import UIKit

class SuggestionsViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Take a bubble bath"
        aLabel.textColor = .black
        aLabel.numberOfLines = 0
        aLabel.font = UIFont.monospacedSystemFont(ofSize: 30, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var tryBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Try another", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        
        return button
    }()

    private lazy var infoView : SuggestionInfoView = {
        let info = SuggestionInfoView()
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    var activityType : ActivityType?
    var isRandom = false
    private var viewModel : SuggestViewModel?

    init( type : String? = nil ) {
        super.init(nibName: nil , bundle: nil)
        
        if let type = type {
            self.activityType = ActivityType(description: type)
            isRandom = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
        view.addSubview(tryBtn)
        view.addSubview(infoView)
        setupView()
        setupConstraint()
        viewModel = SuggestViewModel( on: self ,  service: ActivityService.shared)
        viewModel?.getActivity(type: activityType?.description )
        
        setupNavBar()
    }
    
    func setupNavBar(){
        let label = UILabel()
        label.textColor = .black
        label.text = "Atras"
        label.font = .boldSystemFont(ofSize: 18)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressBack)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
    }
    
    @objc func pressBack(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let activityType = activityType {
            tabBarController?.navigationItem.title = activityType.description
        } else {
            tabBarController?.navigationItem.title = "Random"
        }
    }
    
    private func setupView(){
        view.backgroundColor = .color_background_app
        tryBtn.addTarget(self, action: #selector(pressAnother), for: .touchDown)
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 65 ),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 45),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant:  -45 ),
            tryBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -25),
            tryBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 25 ),
            tryBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -25),
            tryBtn.heightAnchor.constraint(equalToConstant: 45),
            infoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor ,constant: 25),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func pressAnother(){
        viewModel?.getActivity(type: activityType?.description )
    }
    
}

extension SuggestionsViewController : SuggestViewModelDelegate {
    
    func getActivity(activity: Activity) {
        infoView.configData(activity: activity , random : isRandom)
        titleLabel.text = activity.activity
        print(activity)
    }
    
    func handleError(error: Error) {
        print(error)
    }
    
    
}
