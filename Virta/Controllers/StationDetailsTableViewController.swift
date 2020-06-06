//
//  StationDetailsTableViewController.swift
//  Virta
//
//  Created by Tatiana Podlesnykh on 19.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class StationDetailsTableViewController: UITableViewController {
    
    private let viewModel = StationDetailsViewModel()
    private var stationDetail: Station? = nil
    var selectedStationID: Int?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var provider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("selectedStationID: \(selectedStationID)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let id = selectedStationID else {return}
        self.viewModel.getStationDetails(id: id) { (result) in
            DispatchQueue.main.async {
                print(result)
                self.stationDetail = result
                self.name.text = self.stationDetail?.name
                self.address.text = self.stationDetail?.address
                self.provider.text = self.stationDetail?.provider
                print("name1: \(String(describing: self.name.text))")
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.reloadData()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
