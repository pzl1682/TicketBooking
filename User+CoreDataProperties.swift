//
//  User+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/20/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var dob: Date?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var state: String?
    @NSManaged public var userBookFlights: NSSet?
    @NSManaged public var userHaveSeats: NSSet?

}

// MARK: Generated accessors for userBookFlights
extension User {

    @objc(addUserBookFlightsObject:)
    @NSManaged public func addToUserBookFlights(_ value: Flight)

    @objc(removeUserBookFlightsObject:)
    @NSManaged public func removeFromUserBookFlights(_ value: Flight)

    @objc(addUserBookFlights:)
    @NSManaged public func addToUserBookFlights(_ values: NSSet)

    @objc(removeUserBookFlights:)
    @NSManaged public func removeFromUserBookFlights(_ values: NSSet)

}

// MARK: Generated accessors for userHaveSeats
extension User {

    @objc(addUserHaveSeatsObject:)
    @NSManaged public func addToUserHaveSeats(_ value: Seat)

    @objc(removeUserHaveSeatsObject:)
    @NSManaged public func removeFromUserHaveSeats(_ value: Seat)

    @objc(addUserHaveSeats:)
    @NSManaged public func addToUserHaveSeats(_ values: NSSet)

    @objc(removeUserHaveSeats:)
    @NSManaged public func removeFromUserHaveSeats(_ values: NSSet)

}

extension User : Identifiable {

}
