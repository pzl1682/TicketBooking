//
//  Seat+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/20/23.
//
//

import Foundation
import CoreData


extension Seat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Seat> {
        return NSFetchRequest<Seat>(entityName: "Seat")
    }

    @NSManaged public var bookedSeatNumber: Int32
    @NSManaged public var flightNumber: String?

}

extension Seat : Identifiable {

}
