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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        

    }
    
    
    
}

