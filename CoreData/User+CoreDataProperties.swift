//
//  User+CoreDataProperties.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/19/23.
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

extension User : Identifiable {

}
