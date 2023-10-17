//
//  Flight+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/16/23.
//
//

import Foundation
import CoreData


extension Flight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flight> {
        return NSFetchRequest<Flight>(entityName: "Flight")
    }

    @NSManaged public var departure: String?
    @NSManaged public var destination: String?
    @NSManaged public var flightNumber: String?
    @NSManaged public var flightTime: Date?
    @NSManaged public var numberOfSeats: Int32
    @NSManaged public var flightHaveSeats: NSSet?
    @NSManaged public var flightHaveTickets: NSSet?
    @NSManaged public var flightHaveUsers: NSSet?

}

// MARK: Generated accessors for flightHaveSeats
extension Flight {

    @objc(addFlightHaveSeatsObject:)
    @NSManaged public func addToFlightHaveSeats(_ value: Seat)

    @objc(removeFlightHaveSeatsObject:)
    @NSManaged public func removeFromFlightHaveSeats(_ value: Seat)

    @objc(addFlightHaveSeats:)
    @NSManaged public func addToFlightHaveSeats(_ values: NSSet)

    @objc(removeFlightHaveSeats:)
    @NSManaged public func removeFromFlightHaveSeats(_ values: NSSet)

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

// MARK: Generated accessors for flightHaveUsers
extension Flight {

    @objc(addFlightHaveUsersObject:)
    @NSManaged public func addToFlightHaveUsers(_ value: User)

    @objc(removeFlightHaveUsersObject:)
    @NSManaged public func removeFromFlightHaveUsers(_ value: User)

    @objc(addFlightHaveUsers:)
    @NSManaged public func addToFlightHaveUsers(_ values: NSSet)

    @objc(removeFlightHaveUsers:)
    @NSManaged public func removeFromFlightHaveUsers(_ values: NSSet)

}

extension Flight : Identifiable {

}
