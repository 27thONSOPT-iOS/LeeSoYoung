//
//  ViewController.swift
//  Sopt27FirstAssignment
//
//  Created by soyounglee on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var whichPartLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(dataStoF), name: Notification.Name("loginClicked"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToLoginClicked(_ sender: Any) {
        print("Btn goToLoginClicked")
        
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier:"SecondViewController") as? SecondViewController else {
            return
        }
        
        self.navigationController?.pushViewController(svc, animated: true) // 다음 뷰 띄우기
    }
    
    
    @objc func dataStoF() {
        let ad = UIApplication.shared.delegate as? AppDelegate
        whichPartLabel.text = ad?.part
        welcomeLabel.text = "\(String(describing: (ad?.name)!))님 안녕하세요 😄"
        self.viewDidLoad()
    }
    
}