//
//  EvsesTableViewCell.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 19.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class EvsesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var evsesCollectionView: UICollectionView!
    @IBOutlet weak var evsesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    var collectionViewObserver: NSKeyValueObservation?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        evsesCollectionView.register(UINib(nibName: "EvseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EvseCollectionViewCell")
        evsesCollectionView.dataSource = self
        evsesCollectionView.delegate = self
        addObserver()
        evsesCollectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = evsesCollectionView.dequeueReusableCell(withReuseIdentifier: "EvseCollectionViewCell", for: indexPath) as! EvseCollectionViewCell
        cell.id.text = "2010"//vehicle.included[indexPath.item]
        return cell
    }
    
    func addObserver() {
        collectionViewObserver = evsesCollectionView.observe(\.contentSize, changeHandler: { [weak self] (evsesCollectionView, change) in
            self?.evsesCollectionView.invalidateIntrinsicContentSize()
            self?.evsesCollectionViewHeightConstraint.constant = evsesCollectionView.contentSize.height
            self?.evsesCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 1000)
            
            print("Content-size: \(evsesCollectionView.contentSize.height)")
            self?.setNeedsLayout()
            self?.layoutIfNeeded()
        })
    }
    deinit {
        collectionViewObserver = nil
    }

    func setCollectionViewHeight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            UIView.animate(withDuration: 0.1, animations: {
                self.contentView.setNeedsLayout()
            })
        }
    }
}
