//
//  ViewController.swift
//  Not Bored
//
//  Created by Franco Camilletti on 08/09/2022.
//

import UIKit

class TermsViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Terms and conditions"
        aLabel.textColor = .black
        aLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        return aLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let bLabel = UILabel()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        bLabel.text = "Not Bored"
        bLabel.textColor = UIColor(red: 0.03, green: 0.58, blue: 0.94, alpha: 1.00)
        bLabel.font = UIFont.monospacedSystemFont(ofSize: 35, weight: .bold)
        bLabel.textAlignment = .center
        return bLabel
    }()
    
    // MARK: - View Code
    private lazy var scrollView: UIScrollView = {
        let aScrollView = UIScrollView()
        aScrollView.translatesAutoresizingMaskIntoConstraints = false
        return aScrollView
    }()
    
    private lazy var aText: PaddingLabel = {
        let aText = PaddingLabel()
        aText.translatesAutoresizingMaskIntoConstraints = false
        aText.text = "Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis,nullam ligula elementum duis tellus maecenas nec fermentum sed dictumlaoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubiliasenectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet,semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrumaenean et eget pretium volutpat eu dictum dictumst.Praesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctorullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncusmauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringillaad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet maurisleo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostraquam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis. Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu,        elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdumcommodo montes convallis curae facilisis. Vitae diam phasellus litora ad aeneanhimenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis.Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per,tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque."
        aText.textColor = UIColor(red: 0.16, green: 0.17, blue: 0.43, alpha: 1.00)
        aText.font = UIFont.systemFont(ofSize: 20)
        aText.textAlignment = .justified
        aText.topInset = 5.0
        aText.bottomInset = 5.0
        aText.leftInset = 20.0
        aText.rightInset = 20.0
        aText.numberOfLines = 0
        return aText
    }()
    
    private lazy var contentView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    
    @objc private lazy var closeButton: UIButton = {
        let aButton = UIButton()
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setImage(UIImage(named: "close"), for: .normal)
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - View Build
    private func setupView(){

     // Background Color
    self.view.backgroundColor = .color_background_app
    self.view.addSubview(scrollView)
    self.view.addSubview(titleLabel)
    self.view.addSubview(subTitleLabel)
    self.scrollView.addSubview(contentView)
    self.view.addSubview(closeButton)
    self.contentView.addSubview(aText)
        
    closeButton.addTarget(self, action: #selector(closePressed), for: .touchDown)
    
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // SCROLL
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo:view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16),
            
            //CONTENT
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            
            // BUTTON
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 16),
            
            
            // ATEXT
            aText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aText.topAnchor.constraint(equalTo: contentView.firstBaselineAnchor),
            aText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //TITLE
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 90),
            
            //SUBTITLE
            subTitleLabel.topAnchor.constraint(equalTo:titleLabel.topAnchor,constant: 80),
            subTitleLabel.leadingAnchor.constraint(equalTo:titleLabel.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo:titleLabel.trailingAnchor, constant: -16),
        ])
    }
    @objc func closePressed () {
        self.dismiss(animated: true)
    }
}
