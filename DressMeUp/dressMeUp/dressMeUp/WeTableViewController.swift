//
//  WeTableViewController.swift
//  dressMeUp
//
//  Created by Khalil Bennani on 2018-01-21.
//  Copyright © 2018 khalil bennani. All rights reserved.
//

import UIKit
import CoreLocation


class WeTableViewController: UITableViewController ,UISearchBarDelegate {

    @IBOutlet weak var search: UISearchBar!
     var forcastData = [Weather]()
    
    @IBAction func send(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        search.delegate = self
        updateWeatherForlocation(location: "Montreal")
    }
    
    func searchBarSearchButtonClicked(_ search: UISearchBar)
    {
        search.resignFirstResponder()
        if let locationString = search.text, !locationString.isEmpty{
            updateWeatherForlocation(location: locationString)
        }
    }

    func updateWeatherForlocation(location: String)
    {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?)
                        in
                        if let weatherData = results{
                            self.forcastData = weatherData
                            
                             DispatchQueue.main.async {
                                self.tableView.reloadData()
                              }
                        }
                    })
                }
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return forcastData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to:Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date!)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let weatherObject = forcastData[indexPath.section]
        cell.textLabel?.text = "\(Int(weatherObject.temperature)) °F"
        cell.detailTextLabel?.text = weatherObject.summary
        cell.imageView?.image = UIImage(named: weatherObject.icon)
        return cell
        
    }

}
