//
//  Flight+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/13/23.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var destination: String?
    @NSManaged public var departure: String?
    @NSManaged public var flightNumber: String?
    @NSManaged public var flightDate: Date?
    @NSManaged public var flightHaveUsers: NSSet?
    @NSManaged public var flightHaveTickets: NSSet?

}

// MARK: Generated accessors for flightHaveUsers
extension Flight {

    @objc(addFlightHaveUsersObject:)
    @NSManaged public func addToFlightHaveUsers(_ value: Entity)

    @objc(removeFlightHaveUsersObject:)
    @NSManaged public func removeFromFlightHaveUsers(_ value: Entity)

    @objc(addFlightHaveUsers:)
    @NSManaged public func addToFlightHaveUsers(_ values: NSSet)

    @objc(removeFlightHaveUsers:)
    @NSManaged public func removeFromFlightHaveUsers(_ values: NSSet)

}

// MARK: Generated accessors for flightHaveTickets
extension Flight {

    @objc(addFlightHaveTicketsObject:)
    @NSManaged public func addToFlightHaveTickets(_ value: Ticket)

    @objc(removeFlightHaveTicketsObject:)
    @NSManaged public func removeFromFlightHaveTickets(_ value: Ticket)

    @objc(addFlightHaveTickets:)
    @NSManaged public func addToFlightHaveTickets(_ values: NSSet)

    @objc(removeFlightHaveTickets:)
    @NSManaged public func removeFromFlightHaveTickets(_ values: NSSet)

}

extension Flight : Identifiable {

}
