//
//  ChooseFlightVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/15/23.
//

import UIKit
import CoreData

class ChooseFlightVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var flights:[Flight]!
    var selectedFlight: String!
    var userName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        fetchFlightData()
        
        // Do any additional setup after loading the view.
    }
    
    
    func fetchFlightData(){
        if let fetch = DataBaseManager.shared.fetchFlightData(entity: "Flight", flightNumberSearch: "") as? [Flight]{
            flights = fetch
        }
    }

    
    @IBAction func SegueToFlightDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToFlightDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectedFlight == nil {
            let failalert = UIAlertController(title: "Alert", message: "Select a flight to view detail!", preferredStyle: .alert)
            failalert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(failalert, animated: true, completion: nil)
        }
        else if let destinationVC = segue.destination as? FlightDetailVC{
            destinationVC.flightNumber = selectedFlight
            destinationVC.userName = self.userName
        }
    }
    
    

}


extension ChooseFlightVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let FlightCell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as! FlightCell
        let flight = self.flights![indexPath.row]
        FlightCell.FlightNumberLabel.text = flight.flightNumber
        return FlightCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Flight list"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flight = self.flights![indexPath.row]
        selectedFlight = flight.flightNumber
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let removeFlight = self.flights[indexPath.row].flightNumber
            self.flights.remove(at: indexPath.row)
            DataBaseManager.shared.deleteFlightData(entity: "Flight", flightNumber: removeFlight!)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
        
    }
    
    
    
}

