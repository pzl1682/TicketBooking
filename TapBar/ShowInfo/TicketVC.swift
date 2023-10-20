//
//  TicketVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/18/23.
//

import UIKit

class TicketVC: UIViewController {
    
    var selectedUser: User?
    var selectedFlight: Flight?
    var seatText: String!
    
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserDOB: UILabel!
    
    @IBOutlet weak var FlightDeparture: UILabel!
    @IBOutlet weak var FlightArrival: UILabel!
    
    @IBOutlet weak var FlightNumber: UILabel!
    @IBOutlet weak var FlightTime: UILabel!
    @IBOutlet weak var FlightSeat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userBookedSeats = selectedUser!.userHaveSeats
        let userAllSeats = userBookedSeats?.allObjects as? [Seat]
        for se in userAllSeats! {
            print(selectedFlight?.flightNumber)
            print(se.flightNumber)
            if se.flightNumber == selectedFlight?.flightNumber{
                seatText = String(se.bookedSeatNumber)
                FlightSeat.text = seatText
            }
        }
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dob = selectedUser!.dob
        let dobString = dateFormatter.string(from: dob!)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let time = selectedFlight?.flightTime
        let timeString = dateFormatter.string(from: time!)
        
        UserName.text = selectedUser?.name
        UserDOB.text = dobString
        FlightDeparture.text = selectedFlight?.departure
        FlightArrival.text = selectedFlight?.destination
        FlightNumber.text = selectedFlight?.flightNumber
        FlightTime.text = timeString
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func PrintTicket(_ sender: UIButton) {
        saveScreenShot()
    }
    
    func takeScreenShot() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        return renderer.image {_ in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
    
    func saveScreenShot() {
            if let screenShot = takeScreenShot(){
                do{
                    let filename: String = selectedUser!.name! + (selectedFlight?.flightNumber)! + seatText + ".png"
                    try MyFileManager.saveImage(screenShot, to: "Image", with: filename)
                }
                catch{
                    print("Error when saving screenshot")
                }
            }
    }
    

    
    
    
    
    
    
}
