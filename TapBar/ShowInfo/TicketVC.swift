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
    var seat: [Seat]!
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserDOB: UILabel!
    
    @IBOutlet weak var FlightDeparture: UILabel!
    @IBOutlet weak var FlightArrival: UILabel!
    
    @IBOutlet weak var FlightNumber: UILabel!
    @IBOutlet weak var FlightTime: UILabel!
    @IBOutlet weak var FlightSeat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        fetchSeatData()
        
//        print(seat)
        
        
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
        
        FlightSeat.text = String(seat[0].bookedSeatNumber)
        
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
                    let filename: String = selectedUser!.name! + (selectedFlight?.flightNumber)! + String(seat[0].bookedSeatNumber) + ".png"
                    try MyFileManager.saveImage(screenShot, to: "Image", with: filename)
                }
                catch{
                    print("Error when saving screenshot")
                }
            }
    }
    
    
    
    func fetchSeatData(){
        if let fetch = DataBaseManager.shared.fetchSeatData(entity: "Seat", flightNumber: (selectedFlight?.flightNumber)!, userName: (selectedUser?.name)!) as? [Seat]{
            seat = fetch
        }
    }
    
    
    
}
