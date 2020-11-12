//
//  LoginViewController.swift
//  Sopt27FourthAssignment
//
//  Created by soyounglee on 2020/11/09.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var partTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    var restoreFrameValue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //키보드가 나타날 때 keyboardWillAppear 실행
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(sender:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        //키보드가 사라질 때 keyboardWillDisappear 실행
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(sender:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        if let partText = partTF.text, let nameText = nameTF.text {
            NotificationCenter.default.post(name: .init("login"), object: nil, userInfo: ["part": partText ,"name": nameText])
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}


// MARK: TextField & Keyboard Methods
extension LoginViewController: UITextFieldDelegate {
    
    @objc func keyboardWillAppear(sender: NSNotification) {
        if self.view.frame.origin.y == restoreFrameValue {
            if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                self.view.frame.origin.y -= keyboardHeight
            }
            print("keyboard Will appear Execute")
        }
    }
    
    @objc func keyboardWillDisappear(sender: NSNotification) {
        if self.view.frame.origin.y != restoreFrameValue {
            if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                self.view.frame.origin.y += keyboardHeight
            }
            print("keyboard Will Disappear Execute")
        }
    }
    
    //self.view.frame.origin.y = restoreFrameValue
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.frame.origin.y = restoreFrameValue
        print("touches Began Execute")
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn Execute")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing Execute")
        self.view.frame.origin.y = self.restoreFrameValue
        return true
    }
    
}
