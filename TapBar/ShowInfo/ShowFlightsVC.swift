//
//  ShowFlightsVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/18/23.
//

import UIKit

class ShowFlightsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var flights: [Flight]!
    var selectedUser: User?
    var selectedFlight: Flight?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        fetchFlightsData()
        
        // Do any additional setup after loading the view.
    }
    
    
    func fetchFlightsData(){
        let bookedFlights = selectedUser?.userBookFlights as? Set<Flight>
        print(bookedFlights)
        for flight in bookedFlights! {
            flights.append(flight)
            
//            print(fli)
//            let flightNumber = flight.flightNumber
//            print("Flight Number: \(flightNumber ?? "nil")")
//            if let fetchedFlight = DataBaseManager.shared.fetchFlightData(entity: "Flight", flightNumberSearch: flightNumber!) as? [Flight]{
//                print("Fetched Flights: \(fetchedFlight)")
//                let fetch = fetchedFlight[0]
//                print(fetch)
//                flights.append(fetch)
//            }
//            else{
//                print("No flights fetched for Flight Number: \(flightNumber ?? "nil")")
//            }
        }

    }
    
    
    @IBAction func SegueToTicket(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToTicket", sender: nil)
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


extension ShowFlightsVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ShowFlightCell = tableView.dequeueReusableCell(withIdentifier: "ShowFlightCell", for: indexPath) as! ShowFlightCell
        let flight = self.flights![indexPath.row]
        ShowFlightCell.FlightNumberLabel.text = flight.flightNumber
        return ShowFlightCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose a flight to view tickets"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFlight = self.flights![indexPath.row]
//        print(selectedFlight)
//        print(indexPath.row)
    }
    
    
    
    
}
