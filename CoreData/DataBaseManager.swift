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
    
    
    
    
    func fetchUserData(entity: String, nameSearch: String){
        let fetch = NSFetchRequest<NSFetchRequestResult>.init(entityName: entity)
        do{
            let obj = try self.managedContext?.fetch(fetch)
            print(obj!)
        }
        catch{
            print("Error")
        }
        
        
        
    }
    
    
    
    func fetchFlightData(entity: String, flightNumberSearch: String){
        let fetch = NSFetchRequest<NSFetchRequestResult>.init(entityName: entity)
        do{
            let obj = try self.managedContext?.fetch(fetch)
            print(obj)
        }
        catch{
            print("Error")
        }
        
        
        
    }
    
    
}
