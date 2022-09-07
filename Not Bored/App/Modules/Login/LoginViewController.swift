//
//  ViewController.swift
//  Not Bored
//
//  Created by Franco Camilletti on 07/09/2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - View Code
    
    private lazy var titleLabel: UILabel = {
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
    
    private lazy var participantsTextField: UITextField = {
        let aTextField = UITextField()
        aTextField.translatesAutoresizingMaskIntoConstraints = false
        aTextField.backgroundColor = .white
        aTextField.layer.cornerRadius = 8
        aTextField.layer.shadowColor = UIColor.lightGray.cgColor
        aTextField.layer.shadowOffset = CGSize(width: 1, height: 2)
        aTextField.layer.shadowOpacity = 1.0
        aTextField.layer.masksToBounds = false
        aTextField.leftViewMode = .always
        return aTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    
    
    // MARK: - View Build
    
    private func setupView() {
        
        // Background Color
        self.view.backgroundColor = UIColor(red: 0.83, green: 0.96, blue: 1.00, alpha: 1.00)
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(participantsLabel)
        self.view.addSubview(participantsTextField)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            
            participantsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 190),
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  22),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -22),
            
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 10),
            participantsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            participantsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
    
    
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
