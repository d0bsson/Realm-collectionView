//
//  CollectionViewCell.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 11.01.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photo)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
