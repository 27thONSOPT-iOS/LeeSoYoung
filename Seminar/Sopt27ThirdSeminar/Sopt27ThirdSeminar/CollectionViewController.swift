//
//  CollectionViewController.swift
//  Sopt27ThirdSeminar
//
//  Created by soyounglee on 2020/10/31.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var partCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    
    var banners: [String] = ["plan", "design","server","ios","android","web"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partCollectionView.delegate = self
        partCollectionView.dataSource = self
        pageControlInitLayout()
        
        // Do any additional setup after loading the view.
    }
    
    
    func pageControlInitLayout() {
        bannerPageControl.numberOfPages = banners.count
        bannerPageControl.currentPageIndicatorTintColor = .systemYellow
    }
    
    
    
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartBannerCell.identifier, for: indexPath) as? PartBannerCell else {
            
            return UICollectionViewCell()
        }
        cell.setImage(imageName: banners[indexPath.item])
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension CollectionViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        bannerPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
