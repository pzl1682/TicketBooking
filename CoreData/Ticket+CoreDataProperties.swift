//
//  Ticket+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/16/23.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var bookingTime: String?
    @NSManaged public var ticketShowFlight: Flight?

}

extension Ticket : Identifiable {

}
