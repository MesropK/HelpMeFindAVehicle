//
//  ListingDetailViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 1/1/17.
//  Copyright © 2017 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {
    
    var listing: Listing!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ListingDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listing.gallery_images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath)
            as! ListDetailCell
        cell.imageView.image = nil
        URLSession.shared.dataTask(with: URL(string: listing.gallery_images[indexPath.item])!) { (data, respone, error) in
            guard   error == nil,
                    let data = data else  {
                return
            }
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }.resume()
        return cell
    }
    
}
