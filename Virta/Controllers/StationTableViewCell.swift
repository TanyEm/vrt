//
//  SationTableViewCell.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 19.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var connectorCollectionView: UICollectionView!
    @IBOutlet weak var connectorCollectionViewHeightConstraint: NSLayoutConstraint!
    
//    var stationsListTableViewController: StationsListTableViewController?
    var collectionViewObserver: NSKeyValueObservation?
    
    var connectors = [Connector]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        connectorCollectionView.register(UINib(nibName: "ConnectorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConnectorsCollectionViewCell")
        connectorCollectionView.dataSource = self
        connectorCollectionView.delegate = self
        addObserver()
        connectorCollectionView.isScrollEnabled = false
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
        return self.connectors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = connectorCollectionView.dequeueReusableCell(withReuseIdentifier: "ConnectorsCollectionViewCell", for: indexPath) as! ConnectorsCollectionViewCell
        
        let maxKw = self.connectors[indexPath.row].maxKw
        let connectorType = self.connectors[indexPath.row].currentType?.rawValue
        
        cell.kW.text = String("\(maxKw)")
//        if connectorType == "Type2" {
//            cell.image = UIImage(named: "osx_design_view_messages")!
//        } else {}
        return cell
    }
    
    func addObserver() {
        collectionViewObserver = connectorCollectionView.observe(\.contentSize, changeHandler: { [weak self] (connectorCollectionView, change) in
            self?.connectorCollectionView.invalidateIntrinsicContentSize()
            self?.connectorCollectionViewHeightConstraint.constant = connectorCollectionView.contentSize.height
            self?.connectorCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 1000)
            
            print("Content-size: \(connectorCollectionView.contentSize.height)")
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
