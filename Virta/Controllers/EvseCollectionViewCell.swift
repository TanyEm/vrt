//
//  EvseCollectionViewCell.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 20.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class EvseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var evseCollectionViewCellWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWitdth = UIScreen.main.bounds.size.width - (2 * 16)
        self.evseCollectionViewCellWidthConstraint.constant = screenWitdth
        self.id.layer.borderColor = self.UIColorFromRGB(rgbValue: 0x2868a6).cgColor
        self.id.layer.borderWidth = 2
    }
    
        func UIColorFromRGB(rgbValue: UInt) -> UIColor {
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
         }


}
