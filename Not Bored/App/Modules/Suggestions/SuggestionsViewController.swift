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
    
    private lazy var participantContentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceContentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeContentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var tryBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Try another", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        
        return button
    }()

    init( type : String) {
        super.init(nibName: nil , bundle: nil)
        self.title = type
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
        view.addSubview(tryBtn)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(participantContentView)
        stackView.addArrangedSubview(priceContentView)
        stackView.addArrangedSubview(typeContentView)
        
        setupView()
        setupConstraint()
        
    }
    

    private func setupView(){
        view.backgroundColor = .color_background_app
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 65 ),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant:  -25 ),
            tryBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -25),
            tryBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 25 ),
            tryBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -25),
            tryBtn.heightAnchor.constraint(equalToConstant: 45),
            stackView.bottomAnchor.constraint(equalTo: tryBtn.topAnchor , constant: -15 ),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 25 ),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -25),
            participantContentView.heightAnchor.constraint(equalToConstant: 55),
            typeContentView.heightAnchor.constraint(equalToConstant: 55),
            priceContentView.heightAnchor.constraint(equalToConstant: 55)//,
            //stackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
}
