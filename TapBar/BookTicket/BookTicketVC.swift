//
//  BookTicketVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/12/23.
//

import UIKit
import CoreData

class BookTicketVC: UIViewController {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var FlightNumber: UILabel!
    @IBOutlet weak var SeatNumber: UILabel!
    
    
    var username: String?
    var flightnumber: String?
    var seatnumber: Int?
    var user: [User]!
    var flight:[Flight]!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userNameString = username{
            UserName.text = "UserName: " + userNameString
        }
        else{
            UserName.text = "UserName:"
        }
        
        if let flightNumberString = flightnumber{
            FlightNumber.text = "FlightNumber: " + flightNumberString
        }
        else{
            FlightNumber.text = "FlightNumber:"
        }

        if let seatNumberValue = seatnumber {
            SeatNumber.text = "Seat Number: " + String(seatNumberValue)
        } else {
            SeatNumber.text = "Seat Number:"
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func fetchUserData(){
        if let fetch = DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: username!) as? [User]{
            user = fetch
        }
    }
    
    func fetchFlightData(){
        if let fetch = DataBaseManager.shared.fetchFlightData(entity: "Flight", flightNumberSearch: flightnumber!) as? [Flight]{
            flight = fetch
        }
    }
    
    
    
    
    
    @IBAction func SegueToUser(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToUser", sender: nil)
    }
    
    @IBAction func SegueToFlight(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToFlight", sender: nil)
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        
        if UserName.text == "UserName:" || FlightNumber.text == "FlightNumber:" || SeatNumber.text == "Seat Number:"{
            let alert = UIAlertController(title: "Alert", message: "Select user and flight beofre submitting!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{

            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            fetchUserData()
            fetchFlightData()
            
            let user = user[0]
            let flight = flight[0]
            
            
            // save seat info
            let newSeat = NSEntityDescription.insertNewObject(forEntityName: "Seat", into: managedContext) as! Seat
            newSeat.bookedSeatNumber = Int32(seatnumber!)
            flight.addToFlightHaveSeats(newSeat)
            

            
            // save user and flight info
            user.addToUserBookFlights(flight)
            
            
            
            
            //        let newSeat = NSEntityDescription.insertNewObject(forEntityName: "Seat", into: managedContext) as! Seat
            //        newSeat.bookedSeatNumber = seatnumber

            appDelegate.saveContext()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ChooseFlightVC{
            destinationVC.userName = self.username
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
