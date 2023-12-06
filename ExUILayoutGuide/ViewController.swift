//
//  ViewController.swift
//  ExUILayoutGuide
//
//  Created by 김종권 on 2023/12/06.
//

import UIKit

class ViewController: UIViewController {
    private let myView1 = MyView1()
    private let myView2 = MyView2()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView1)
        view.addSubview(myView2)
        
        NSLayoutConstraint.activate([
            myView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            myView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            myView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

final class MyView1: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "circle")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .gray.withAlphaComponent(0.3)
        
        addSubview(button)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

final class MyView2: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "circle")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var layoutGuide: UILayoutGuide = {
        let guide = UILayoutGuide()
        addLayoutGuide(guide)
        return guide
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .gray.withAlphaComponent(0.3)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(button)
        addSubview(imageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            layoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            layoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            layoutGuide.topAnchor.constraint(equalTo: button.bottomAnchor),
            layoutGuide.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
