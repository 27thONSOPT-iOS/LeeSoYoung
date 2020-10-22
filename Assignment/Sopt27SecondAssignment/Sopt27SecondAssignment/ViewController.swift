//
//  ViewController.swift
//  Sopt27SecondAssignment
//
//  Created by soyounglee on 2020/10/19.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet var hallView: UIView!
    @IBOutlet weak var topBtnView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 버튼을 뷰 제일 위로 가져오기
        hallView.bringSubviewToFront(topBtnView)
        // 처음에 버튼 안보이게하기
        topBtn.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView.contentOffset.y: \(scrollView.contentOffset.y)")
        print("secondView.frame.size.height: \(secondView.frame.size.height)")
        
        
        if(scrollView.contentOffset.y >  (secondView.frame.size.height)) {
            topBtn.isHidden = false
            
        } else {
            topBtn.isHidden = true
            
        }
    }
    
    @IBAction func topBtnClicked(_ sender: Any) {
        // 스크롤 뷰 좌표 0.0 으로
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

    }
    
}

