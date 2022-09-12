//
//  SuggestionInfoView.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 12/09/2022.
//

import Foundation
import UIKit

class SuggestionInfoView : UIView {
    
    private lazy var participantContentView : SuggestionDescriptionRow = {
        let view = SuggestionDescriptionRow()
        view.setupRow(image: "close", title: "Participant")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceContentView : SuggestionDescriptionRow = {
        let view = SuggestionDescriptionRow()
        view.setupRow(image: "close", title: "Price")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeContentView : SuggestionDescriptionRow = {
        let view = SuggestionDescriptionRow()
        view.setupRow(image: "close", title: "Relaxation")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)

        stackView.addArrangedSubview(participantContentView)
        stackView.addArrangedSubview(priceContentView)
        stackView.addArrangedSubview(typeContentView)
        
        setupConstraint()
        
    }
    
    func configData(activity : Activity , random : Bool ){
        participantContentView.setupRow(image: "close", title : "Participants" ,  description : "\(activity.participants)" )
        priceContentView.setupRow(image: "close", title: "Price" , description: activity.priceType )
        
        if random {
            typeContentView.isHidden = true
        } else {
            typeContentView.setupRow(image: "close", title: activity.type.capitalized )
        }
        
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            participantContentView.heightAnchor.constraint(equalToConstant: 45),
            priceContentView.heightAnchor.constraint(equalToConstant: 45),
            typeContentView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
