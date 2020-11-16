//
//  CustomTabBarViewController.swift
//  Sopt27FourthSeminar
//
//  Created by soyounglee on 2020/11/07.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        
    }
    
    
    func setTabBar() {
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") as? GreenVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
        else {
            return
        }
        
        
        greenVC.tabBarItem.title = "Home"
        greenVC.tabBarItem.image = UIImage(systemName: "house")
        greenVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        blueVC.tabBarItem.title = "Profile"
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        setViewControllers([greenVC, blueVC], animated: true)
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
