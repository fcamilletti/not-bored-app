//
//  ActivityCell.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import UIKit

class ActivityTableViewCell: UITableViewCell {

    static let identifier = "ActivityTableViewCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var enterImage: UIImageView = {
        let aImage = UIImageView()
        aImage.image = UIImage(named: "icon_enter")
        aImage.translatesAutoresizingMaskIntoConstraints = false
        
        return aImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(separatorView)
        contentView.addSubview(enterImage)
        
        setupConstraint()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        
    }

    func configCell(text : String){
        label.text = text.capitalized
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 35),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 35),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant:  -35),
            separatorView.heightAnchor.constraint(equalToConstant: 1 ),
            enterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -55 ),
            enterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
