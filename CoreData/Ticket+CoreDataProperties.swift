//
//  Ticket+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/13/23.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userAge: Int32
    @NSManaged public var userDOB: Date?
    @NSManaged public var flightDeparture: String?
    @NSManaged public var flightArrival: String?
    @NSManaged public var flightDate: Date?
    @NSManaged public var flightNumber: String?
    @NSManaged public var ticketShowFlightInfo: Flight?
    @NSManaged public var ticketShowUserInfo: Entity?

}

extension Ticket : Identifiable {

}
