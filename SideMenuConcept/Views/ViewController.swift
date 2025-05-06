//
//  ViewController.swift
//  Communicator
//
//  Created by Kacper Marciszewski on 05/04/2025.
//

import UIKit

class ViewController: UIViewController {
     
    var isMenuOpen = false
    lazy var sideInMenuPadding: CGFloat = self.view.frame.width * 0.3
    
    lazy var settingsButton = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading") , style: .done, target: self, action: #selector (openSideMenu))
    
    @objc func openSideMenu() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.containerView.frame.origin.x = self.isMenuOpen ? 0 : self.containerView.frame.width - self.sideInMenuPadding
        } completion: { (finished) in
            print("Done\(finished)")
            self.isMenuOpen.toggle()
        }
    }
    
    lazy var menuView: UIView = {
       let view = UIView()
       view.backgroundColor = .systemGray5
       return view
        
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
    
        navigationItem.setLeftBarButton(settingsButton, animated: true)
        
        navigationController?.navigationBar.tintColor = .black
        title = "Byczek"
        
        menuView.pinMenuTo(view, with: sideInMenuPadding)
        containerView.edgeTo(view)
    }


}

public extension UIView {
    func edgeTo(_ view: UIView){
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    func pinMenuTo(_ view: UIView, with constant: CGFloat) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
}

