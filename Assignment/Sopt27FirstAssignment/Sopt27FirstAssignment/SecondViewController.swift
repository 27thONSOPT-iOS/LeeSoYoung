//
//  SecondViewController.swift
//  Sopt27FirstAssignment
//
//  Created by soyounglee on 2020/10/11.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var loginPartTF: UITextField!
    @IBOutlet weak var loginNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = " Login "
        self.navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        print("Btn loginClicked")
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.part = loginPartTF.text!
        ad?.name = loginNameTF.text!
        
        NotificationCenter.default.post(name: Notification.Name("loginClicked"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToSignUpClicked(_ sender: Any) {
        print("Btn goToSignUpClicked")
        
        guard let tvc = self.storyboard?.instantiateViewController(withIdentifier:"ThirdViewController") as? ThirdViewController else {
            return
        }
        
        self.navigationController?.pushViewController(tvc, animated: true) // 다음 뷰 띄우기
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
