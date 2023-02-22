//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Marcos Mendes on 20/02/23.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        view.addSubview(button)
        
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top + 25,
            width: view.frame.width,
            height: view.frame.height - 300
        )
        
        let buttonYPosition = view.frame.size.height - 100 - view.safeAreaInsets.bottom
        let buttonWidth = view.frame.size.width - 40
        
        button.frame = CGRect(
            x: 20, y: buttonYPosition, width: buttonWidth, height: 55
        )
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    func getRandomPhoto() {
        let imageHost = "https://source.unsplash.com/random/1200x1200"
        let url = URL(string: imageHost)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image = UIImage(data: data)
    }
}

