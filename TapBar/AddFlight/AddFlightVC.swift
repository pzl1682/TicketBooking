//
//  AddFlightVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/12/23.
//

import UIKit
import CoreData

class AddFlightVC: UIViewController {
    
    @IBOutlet weak var FlightNumberLabel: UILabel!
    @IBOutlet weak var FlightNumberText: UITextField!
    
    @IBOutlet weak var FlightTimeLabel: UILabel!
    @IBOutlet weak var FlightTimeDate: UIDatePicker!
    
    @IBOutlet weak var FlightSeatLabel: UILabel!
    @IBOutlet weak var FlightSeatText: UITextField!
    
    @IBOutlet weak var DepartureLabel: UILabel!
    @IBOutlet weak var DepartureText: UITextField!
    
    
    @IBOutlet weak var ArrivalLabel: UILabel!
    @IBOutlet weak var ArrivalText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        
        if FlightNumberText.text?.isEmpty == true || FlightSeatText.text?.isEmpty == true || DepartureText.text?.isEmpty == true || ArrivalText.text?.isEmpty == true {
            let failalert = UIAlertController(title: "Alert", message: "Please fill in all the required fields.", preferredStyle: .alert)
            failalert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(failalert, animated: true, completion: nil)
        }
        
        else{
            
            DataBaseManager.shared.saveFlightData(FlightNumber: FlightNumberText.text!, FlightTime: FlightTimeDate.date, FlightSeat: Int(FlightSeatText.text!)!, Departure: DepartureText.text!, Arrival: ArrivalText.text!, entity: "Flight")
            
            let successalert = UIAlertController(title: "Successful", message: "Successfully Saved Flight Info!", preferredStyle: UIAlertController.Style.alert)
            successalert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(successalert, animated: true, completion: nil)
            
//            DataBaseManager.shared.fetchFlightData(entity: "Flight", flightNumberSearch: "")
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
}
