//
//  ListingCell.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 1/1/17.
//  Copyright © 2017 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

class ListingListCell: UITableViewCell {
    
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var careNameLabel: UILabel!
    
    @IBOutlet weak var carPriceLabel: UILabel!
    
    
    @IBOutlet weak var carMilesLabel: UILabel!
    
    var listing: Listing! {
        didSet {
            self.careNameLabel.text = listing.title
            self.carPriceLabel.text = listing.price
            self.carMilesLabel.text = listing.mileage
            if let urlString = listing.gallery_images.first,
                let url = URL(string: urlString) {
                    self.loadImageAt(url: url) { (image) in
                        DispatchQueue.main.sync {
                            self.imageView?.image = nil
                            if url.absoluteString == self.listing.gallery_images.first! {
                                self.imageView?.image = image
                            }
                        }
                }
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadImageAt(url: URL, image: @escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard   error == nil,
                    let data = data else {
                return
            }
            image(UIImage(data: data))
        }
    }

}
