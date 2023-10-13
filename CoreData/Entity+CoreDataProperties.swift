//
//  Entity+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/13/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "User")
    }

    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var dob: Date?
    @NSManaged public var age: Int32
    @NSManaged public var userHaveFlights: NSSet?
    @NSManaged public var userHaveTickets: NSSet?

}

// MARK: Generated accessors for userHaveFlights
extension Entity {

    @objc(addUserHaveFlightsObject:)
    @NSManaged public func addToUserHaveFlights(_ value: Flight)

    @objc(removeUserHaveFlightsObject:)
    @NSManaged public func removeFromUserHaveFlights(_ value: Flight)

    @objc(addUserHaveFlights:)
    @NSManaged public func addToUserHaveFlights(_ values: NSSet)

    @objc(removeUserHaveFlights:)
    @NSManaged public func removeFromUserHaveFlights(_ values: NSSet)

}

// MARK: Generated accessors for userHaveTickets
extension Entity {

    @objc(addUserHaveTicketsObject:)
    @NSManaged public func addToUserHaveTickets(_ value: Ticket)

    @objc(removeUserHaveTicketsObject:)
    @NSManaged public func removeFromUserHaveTickets(_ value: Ticket)

    @objc(addUserHaveTickets:)
    @NSManaged public func addToUserHaveTickets(_ values: NSSet)

    @objc(removeUserHaveTickets:)
    @NSManaged public func removeFromUserHaveTickets(_ values: NSSet)

}

extension Entity : Identifiable {

}
