//
//  UserDetailVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/17/23.
//

import Foundation
import UIKit

class UserDetailVC: UIViewController {
    
    var name: String!
    var user: [User]!
    
    

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextLabel: UILabel!
    
    
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailTextLabel: UILabel!
    
    
    @IBOutlet weak var DOBLabel: UILabel!
    @IBOutlet weak var DOBTextLabel: UILabel!
    
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var StateLabel: UILabel!
    @IBOutlet weak var CityLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(name)
//        print(user)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = user[0].dob
        let dateString = dateFormatter.string(from: date!)
        
        NameTextLabel.text = user[0].name
        EmailTextLabel.text = user[0].email
        DOBTextLabel.text = dateString
        CountryLabel.text = user[0].country
        StateLabel.text = user[0].state
        CityLabel.text = user[0].city
        
        
        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? BookTicketVC{
            destinationVC.username = name
        }
    }
    

    @IBAction func SegueToBook(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueFromUserToBook", sender: nil)
    }
    



}
