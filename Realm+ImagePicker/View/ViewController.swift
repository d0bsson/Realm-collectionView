//
//  ViewController.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 10.01.2024.
//
import PhotosUI
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    private var images: [UIImage] = []
    private var realmMmanager = RealmManager()
    
    lazy var collection = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width / 4, height: view.frame.size.height / 10)
        
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .gray
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        addNavigationItem()
    }
    
    private func addNavigationItem() {
        let addImage = UIBarButtonItem(systemItem: .add, primaryAction: addImageAction)
        navigationItem.rightBarButtonItem = addImage
    }
    
    lazy var addImageAction = UIAction { _ in
        var config = PHPickerConfiguration()
        config.selectionLimit = 5
        
        let pickerVC = PHPickerViewController(configuration: config)
        pickerVC.delegate = self
        
        self.present(pickerVC, animated: true)
        self.collection.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        cell.photo.image = images[indexPath.row]
        return cell
    }
}

// add photo from ImagePicker to CollectionView and save it in app directory
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage {
                    if let imageData = image.jpegData(compressionQuality: 0.1) {
                        self.realmMmanager.saveImage(imageData: imageData)
                        self.images.append(image)
                    }
                }
                DispatchQueue.main.async {
                    self.collection.reloadData()
                    print("reload5")
                }
            }
        }
    }
}



