//
//  DataBaseManager.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/13/23.
//

import Foundation
import UIKit
import CoreData

class DataBaseManager: NSObject{
    
    var managedContext: NSManagedObjectContext!
    
    static let shared: DataBaseManager = {
        let instance = DataBaseManager()
        return instance
    }()
    
    private override init(){
        super.init()
        setUpDelegate()
    }
    
    func setUpDelegate(){
        guard let appDeledate = UIApplication.shared.delegate as? AppDelegate else{return}
        let container = appDeledate.persistentContainer
        self.managedContext = container.viewContext
    }
    
    
    func saveUserData(name: String, country: String, state: String, city: String, email: String, dob: Date, entity: String){
        let entity = NSEntityDescription.entity(forEntityName: entity, in: self.managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: self.managedContext)
        
        user.setValue(name, forKey: "name")
        user.setValue(country, forKey: "country")
        user.setValue(state, forKey: "state")
        user.setValue(city, forKey: "city")
        user.setValue(email, forKey: "email")
        user.setValue(dob, forKey: "dob")
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        appDelegate.saveContext()
    }
    
    
    func saveFlightData(FlightNumber: String, FlightTime: Date, FlightSeat: Int, Departure: String, Arrival: String, entity: String){
        let entity = NSEntityDescription.entity(forEntityName: entity, in: self.managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: self.managedContext)
        
        user.setValue(FlightNumber, forKey: "flightNumber")
        user.setValue(FlightTime, forKey: "flightTime")
        user.setValue(FlightSeat, forKey: "numberOfSeats")
        user.setValue(Departure, forKey: "departure")
        user.setValue(Arrival, forKey: "destination")
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        appDelegate.saveContext()
    }
    
    
    func fetchUserData(entity: String, nameSearch: String) -> [NSManagedObject]?{
        let fetch = NSFetchRequest<NSManagedObject>.init(entityName: entity)
        
        if !nameSearch.isEmpty{
            fetch.predicate = NSPredicate(format: "name == %@", nameSearch)
        }
        
        do{
            let users = try self.managedContext?.fetch(fetch)
//            print(users)
            return users
        }
        catch{
            print("Error when fetching user data")
            return nil
        }
        
    }
    
    
    
    func fetchFlightData(entity: String, flightNumberSearch: String) -> [NSManagedObject]?{
        let fetch = NSFetchRequest<NSManagedObject>.init(entityName: entity)
        
        if !flightNumberSearch.isEmpty{
            fetch.predicate = NSPredicate(format: "flightNumber == %@", flightNumberSearch)
        }

        do{
            let flights = try self.managedContext?.fetch(fetch)
            return flights
        }
        catch{
            print("Error when fetching flight data")
            return nil
        }
        
        
        
    }
    
    
    func deleteUserData(entity: String, name: String){
        let fetch = NSFetchRequest<NSManagedObject>.init(entityName: entity)
        fetch.predicate = NSPredicate(format: "name == %@", name)
        
        do{
            if let result = try self.managedContext.fetch(fetch).first{
                self.managedContext.delete(result)
                
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
                appDelegate.saveContext()
            }
        }
        catch{
            print("Error when deleting User Data")
        }
    }
    
    
    func deleteFlightData(entity: String, flightNumber: String){
        let fetch = NSFetchRequest<NSManagedObject>.init(entityName: entity)
        fetch.predicate = NSPredicate(format: "flightNumber == %@", flightNumber)
        
        do{
            if let result = try self.managedContext.fetch(fetch).first{
                self.managedContext.delete(result)
                
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
                appDelegate.saveContext()
            }
        }
        catch{
            print("Error when deleting Flight Data")
        }
    }
    
    
}
