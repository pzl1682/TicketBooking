//
//  Flight+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/20/23.
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

extension Flight : Identifiable {

}
