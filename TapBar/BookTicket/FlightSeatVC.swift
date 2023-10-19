//
//  FlightSeatVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/17/23.
//

import UIKit

class FlightSeatVC: UIViewController{
    
    var flightnumber: String!
    var bookedSeats: [Seat]?
    var selectedSeat: Int!
    var userName: String!
    var flightSeats: Int!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(flightnumber)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SegueFromFlightToBook(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueFromFlightToBook", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? BookTicketVC{
            destinationVC.seatnumber = selectedSeat
            destinationVC.flightnumber = flightnumber
            destinationVC.username = userName
        }
    }
    
    

//    func fetchFlightData(){
//
//    }

}

extension FlightSeatVC:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flightSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let FlightSeatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlightSeatCell", for: indexPath) as! FlightSeatCell
        FlightSeatCell.SeatLabel.text = String(indexPath.row + 1)
        if let bookedSeats = bookedSeats, bookedSeats.contains(where: { $0.bookedSeatNumber == indexPath.row + 1 }){
            FlightSeatCell.backgroundColor = .orange
            FlightSeatCell.isUserInteractionEnabled = false
        }
        else{
            FlightSeatCell.backgroundColor = .white
            FlightSeatCell.isUserInteractionEnabled = true
        }
        
        return FlightSeatCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = UIColor.green
        }
        selectedSeat = indexPath.row + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = UIColor.white
        }
    }
    
    
}
