//
//  WeatherTVC.swift
//  WeatherApp
//
//  Created by Vandan Patel on 11/29/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import UIKit

class WeatherTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }

}
