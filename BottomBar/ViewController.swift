//
//  ViewController.swift
//  BottomBar
//
//  Created by Mahmut MERCAN on 26.02.2021.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("login", for: UIControl.State.normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: UIControl.State.normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(setupNavigationBar), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
        
    }
    
    @objc func setupNavigationBar() {
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        vc1.title = "Home"
        vc2.title = "Notification"
        vc3.title = "About"
        vc4.title = "Contact"
        vc5.title = "Settings"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house", "bell", "book", "book.closed", "gear"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        let badgeValues = ["1", "2", "3", "32", "13"]
        
        for y in 0..<items.count {
            items[y].badgeValue = badgeValues[y]
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Notification"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "About"
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Contact"
    }
}

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Settings"
    }
}
