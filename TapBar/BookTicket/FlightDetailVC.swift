//
//  FlightDetailVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/17/23.
//

import UIKit

class FlightDetailVC: UIViewController {
    
    var flightNumber: String!
    var flight: [Flight]!
    var bookedSeats: [Seat]?
    var userName: String!
    var flightSeats: Int!


    @IBOutlet weak var FlightNumberLabel: UILabel!
    @IBOutlet weak var FlightNumberText: UILabel!
    
    @IBOutlet weak var FlightTimeLabel: UILabel!
    @IBOutlet weak var FlightTimeText: UILabel!
    
    @IBOutlet weak var FlightSeatLabel: UILabel!
    @IBOutlet weak var FlightSeatText: UILabel!
    
    @IBOutlet weak var DepartureLabel: UILabel!
    @IBOutlet weak var DepartureText: UILabel!
    
    @IBOutlet weak var ArrivalLabel: UILabel!
    @IBOutlet weak var ArrivalText: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFlightData()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = flight[0].flightTime
        let dateString = dateFormatter.string(from: date!)
        
        FlightNumberText.text = flight[0].flightNumber
        FlightTimeText.text = dateString
        flightSeats = Int(flight[0].numberOfSeats)
        FlightSeatText.text = String(flightSeats)
        DepartureText.text = flight[0].departure
        ArrivalText.text = flight[0].destination
        
        fetchBookedSeatsForFlight(flight: flight[0])
        
        // Do any additional setup after loading the view.
    }
    
    func fetchBookedSeatsForFlight(flight: Flight) {
        if let seatsSet = flight.flightHaveSeats as? Set<Seat> {
            bookedSeats = Array(seatsSet)
        }
    }
    

    func fetchFlightData(){
        if let fetch = DataBaseManager.shared.fetchFlightData(entity: "Flight", flightNumberSearch: flightNumber) as? [Flight]{
            flight = fetch
//            print(flight)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FlightSeatVC{
            destinationVC.flightnumber = flightNumber
            destinationVC.bookedSeats = bookedSeats
            destinationVC.userName = self.userName
            destinationVC.flightSeats = self.flightSeats
        }
    }
    
    
    @IBAction func SegueToSeats(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToSeats", sender: nil)
    }
    

}
