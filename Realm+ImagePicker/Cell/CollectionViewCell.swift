//
//  CollectionViewCell.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 11.01.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let storage = StorageManager()
    
    lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func getImage(name: String) {
        photo.image = UIImage(data: storage.loadImage(fileName: name))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
