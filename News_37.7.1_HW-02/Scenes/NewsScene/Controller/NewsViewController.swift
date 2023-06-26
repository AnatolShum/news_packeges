//
//  NewsViewController.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 21/06/2023.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage

class NewsViewController: UICollectionViewController {
    
    let url = "https://newsapi.org/v2/everything?q=apple&from=2023-06-11&to=2023-06-11&sortBy=popularity&apiKey=3cd00c5eb2234eafb18af98a5884a6bb&page=1&pageSize=100"
    
    var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
        fetchJson()
        
        collectionView.backgroundColor = .white
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        
        collectionView.isPagingEnabled = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseIdentifier, for: indexPath) as! NewsCell
        let item = news[indexPath.item]
        
        cell.newsImageView.sd_setImage(with: URL(string: item.url ?? ""))
        cell.configureCell(title: item.title ?? "N/A", description: item.description ?? "N/A")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let new = news[indexPath.item]
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let detailController = DetailViewController(collectionViewLayout: layout)
        detailController.new = new
        
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func fetchJson() {
        AF.request(url).responseJSON { response in
            guard let json = response.value as? [String: Any] else {
                print("Failed fetch data")
                return
            }
            
            guard let fetchedArticles = Articles(JSON: json) else { return }
            guard let articles = fetchedArticles.articles else { return }
            articles.forEach { self.news.append($0) }
            self.collectionView.reloadData()
        }
    }
    
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 10, height: 110)
    }
}
