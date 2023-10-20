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
        
//        print(self.selectedUser)
//        print(self.selectedFlight)
        // Do any additional setup after loading the view.
    }
    
    
    func fetchFlightsData(){
        
        let userBookedFlights = selectedUser!.userBookFlights
        let bookedFlight = userBookedFlights?.allObjects as? [Flight]
        flights = bookedFlight
        
        }

    
    
    @IBAction func SegueToTicket(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToTicket", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? TicketVC {
            destinationVC.selectedUser = selectedUser
            destinationVC.selectedFlight = selectedFlight
//            print(destinationVC.selectedUser)
//            print(destinationVC.selectedFlight)
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
