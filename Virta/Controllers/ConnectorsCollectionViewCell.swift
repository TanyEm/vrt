//
//  ConnectorsCollectionViewCell.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 20.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class ConnectorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var kW: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var connectorCollectionViewCellWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWitdth = UIScreen.main.bounds.size.width - (2 * 16)
        self.connectorCollectionViewCellWidthConstraint.constant = screenWitdth
    }

}
