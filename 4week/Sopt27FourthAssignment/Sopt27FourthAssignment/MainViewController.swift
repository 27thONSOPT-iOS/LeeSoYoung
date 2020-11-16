//
//  MainViewController.swift
//  Sopt27FourthAssignment
//
//  Created by soyounglee on 2020/11/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(login), name: .init("login"), object: nil)
        // Do any additional setup after loading the view.
    }
    

    @objc func login(_ notification: Notification) {
            
            guard let info = notification.userInfo as? [String: Any] else { return }
            let partText: String? = info["part"] as? String
            let nameText: String? = info["name"] as? String
            
            partLabel.text = partText == "" ? "iOS" : partText
            welcomeLabel.text = nameText == "" ? "로그인 해주세요" : nameText
    }
}
