//
//  DetailViewController.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 26/06/2023.
//

import UIKit
import SDWebImage

class DetailViewController: UICollectionViewController {
    
    var new: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.reuseIdentifier)
        
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.reuseIdentifier, for: indexPath) as! DetailCell
        
        cell.newsImageView.sd_setImage(with: URL(string: new?.url ?? ""))
        cell.configureCell(title: new?.title ?? "N/A", description: new?.description ?? "N/A")
        
        return cell
    }
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
