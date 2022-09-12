//
//  SuggestionDescriptionRow.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 12/09/2022.
//

import Foundation
import UIKit


class SuggestionDescriptionRow : UIView {
    
    lazy var iconView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel : UILabel = {
        let alabel = UILabel()
        alabel.numberOfLines = 1
        alabel.translatesAutoresizingMaskIntoConstraints = false
        return alabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(iconView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        setupConstraint()
        
        self.backgroundColor = .clear
        
    }
    
    func setupRow(image : String , title : String , description : String? = nil){
        iconView.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description ?? ""
        
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 15 ),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor , constant: 15 ),
            descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -25),
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor , constant: 25)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
