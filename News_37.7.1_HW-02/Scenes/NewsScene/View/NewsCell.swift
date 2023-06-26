//
//  NewsCell.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 21/06/2023.
//

import UIKit

class NewsCell: UICollectionViewCell {
    static let reuseIdentifier = "NewsCell"
    
    let newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.tintColor = .darkGray
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
        addUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUI() {
        addSubview(newsImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.heightAnchor.constraint(equalToConstant: 90),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 1/1),
            newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configureCell(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
