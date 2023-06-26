//
//  DetailCell.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 26/06/2023.
//

import UIKit

class DetailCell: UICollectionViewCell {
    static let reuseIdentifier = "DetailCell"
    
    let newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.tintColor = .darkGray
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        
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
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 3/2),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            newsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func configureCell(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
