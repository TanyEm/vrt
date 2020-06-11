//
//  StationsListTableViewController.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 19.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit
import CoreLocation

class StationsListTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    
    private let viewModel = StationsListViewModel()
    private var stationsList = [BasicStationInfo]()
    private let cellSpacingHeight: CGFloat = 5
    var connectorsList = [Connector]()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.viewModel.getStations(self.locationManager) { list in
            DispatchQueue.main.async {
                print(list)
                self.stationsList = list
                
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.stationsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationCell", for: indexPath) as! StationTableViewCell
        
        // Configure the cell...
        let stationItem = self.stationsList[indexPath.row]
        
        cell.address.text = stationItem.address
        cell.name.text = stationItem.name
        
        cell.distance.text = "\(stationItem.distanceFromUser!) km"
        
//        guard let evs = stationItem.evses else {
//            return cell
//        }
        
        cell.connectors = [Connector]()
        cell.connectorCollectionView.reloadSections(IndexSet(integer: 0))

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedCell = stationsList[indexPath.row]
//
//        if let viewController = storyboard?.instantiateViewController(identifier: "StationDetailsTableViewController") as? StationDetailsTableViewController{
//            viewController.selectedStationID = selectedCell.id
//            navigationController?.pushViewController(viewController, animated: true)
//        }
//    }
    
    // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "stationTapped" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! StationDetailsTableViewController
                controller.selectedStationID = stationsList[indexPath.row].id
            }
        }
    }
}


