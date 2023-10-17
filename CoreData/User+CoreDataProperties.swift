//
//  User+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/16/23.
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
    @NSManaged public var userHaveFlights: NSSet?

}

// MARK: Generated accessors for userHaveFlights
extension User {

    @objc(addUserHaveFlightsObject:)
    @NSManaged public func addToUserHaveFlights(_ value: Flight)

    @objc(removeUserHaveFlightsObject:)
    @NSManaged public func removeFromUserHaveFlights(_ value: Flight)

    @objc(addUserHaveFlights:)
    @NSManaged public func addToUserHaveFlights(_ values: NSSet)

    @objc(removeUserHaveFlights:)
    @NSManaged public func removeFromUserHaveFlights(_ values: NSSet)

}

extension User : Identifiable {

}
