//
//  VenueTableViewCell.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 01.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {

    static let reuseIdentifier = "VenueTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func initWithViewModel(_ model: VenueViewModel) {
    
        self.nameLabel.text = model.name
        self.distanceLabel.text = model.distance
        self.addressLabel.text = model.address
        self.categoryLabel.text = model.category
    }
}
