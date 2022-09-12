//
//  ViewController.swift
//  Not Bored
//
//  Created by Franco Camilletti on 07/09/2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - View Code
    
    private lazy var notBoredTitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Not Bored"
        aLabel.textColor = UIColor(red: 0.03, green: 0.58, blue: 0.94, alpha: 1.00)
        aLabel.font = UIFont.monospacedSystemFont(ofSize: 35, weight: .bold)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var participantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Participants"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return aLabel
    }()
    
    private lazy var participantsTextField: NotBoredTextField = {
        let aTextField = NotBoredTextField()
        aTextField.translatesAutoresizingMaskIntoConstraints = false
        return aTextField
    }()
    
    private lazy var startButton: UIButton = {
        let aButton = UIButton()
        aButton.automaticallyUpdatesConfiguration = true
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.layer.cornerRadius = 12
        aButton.setTitle("Start!", for: .normal)
        aButton.backgroundColor = UIColor(red: 0.03, green: 0.58, blue: 0.94, alpha: 1.00)
        return aButton
    }()
    
    private lazy var termsButton: UIButton = {
        let aButton = UIButton()
        let attributedTerms = NSMutableAttributedString.init(string: "Terms and conditions")
        attributedTerms.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedTerms.length))
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitleColor(.black, for: .normal)
        aButton.setAttributedTitle(attributedTerms, for: .normal)
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - View Build
    
    private func setupView() {
        
        // Background Color
        self.view.backgroundColor = .color_background_app
        
        // Subviews
        self.view.addSubview(notBoredTitleLabel)
        self.view.addSubview(participantsLabel)
        self.view.addSubview(participantsTextField)
        participantsTextField.addTarget(self, action: #selector(change), for: .editingChanged)
        self.view.addSubview(startButton)
        startButton.isEnabled = false
        startButton.setTitle("Tell me the number of participants", for: .normal)
        startButton.backgroundColor = UIColor.gray
        self.view.addSubview(termsButton)
        
        // Interactions
        startButton.addTarget(self, action: #selector(startPressed), for: .touchDown)
        termsButton.addTarget(self, action: #selector(termsPressed), for: .touchDown)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            notBoredTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            notBoredTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            notBoredTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            participantsLabel.topAnchor.constraint(equalTo: notBoredTitleLabel.bottomAnchor, constant: 180),
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  22),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -22),
            
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 10),
            participantsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            participantsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 48),
            
            startButton.topAnchor.constraint(equalTo: participantsTextField.bottomAnchor, constant: 170),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            
            termsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 5),
            termsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
    
    //MARK: - Interactions

    @objc func startPressed () {
        let vc = HomeTabBarController()
        let nv = BaseNavigationController(rootViewController: vc)
        nv.modalPresentationStyle = .fullScreen
        self.present(nv , animated: true)
    }

    @objc func termsPressed () {
        let vc = TermsViewController()
        self.present(vc, animated: true)
    }

    @objc func change(textField: NotBoredTextField) {
        if let n = Int(textField.text ?? "") {
            if n > 0 {
                startButton.isEnabled = true
                startButton.setTitle("Start!", for: .normal)
                startButton.backgroundColor = UIColor(red: 0.03, green: 0.58, blue: 0.94, alpha: 1.00)
            } else {
                startButton.isEnabled = false
                startButton.setTitle("Tell me the number of participants", for: .normal)
                startButton.backgroundColor = UIColor.gray
            }
        } else {
            startButton.isEnabled = false
            startButton.setTitle("Tell me the number of participants", for: .normal)
            startButton.backgroundColor = UIColor.gray
        }
    }
}
