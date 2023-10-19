//
//  FlightSeatCell.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/17/23.
//

import UIKit

class FlightSeatCell: UICollectionViewCell {
    
    var isBooked: Bool = false
    
    @IBOutlet weak var SeatLabel: UILabel!
    
    @IBOutlet weak var SeatImage: UIImageView!
    
}
