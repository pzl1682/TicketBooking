//
//  UserInfoInputVC.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit
import CoreData

class UserInfoInputVC: UIViewController {
    

    var selectedCountry: String?
    var selectedState: String?
    var selectedCity: String?
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameText: UITextField!
    
    @IBOutlet weak var DOBLabel: UILabel!
    @IBOutlet weak var DOBPicker: UIDatePicker!
    
    @IBOutlet weak var LocationLabel: UILabel!
    

    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailText: UITextField!
    
    
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var StateLabel: UILabel!
    @IBOutlet weak var CityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(selectedCountry)
//        print(selectedState)
//        print(selectedCity)
        
        
        
        CountryLabel.text = selectedCountry ?? "Country"
        StateLabel.text = selectedState ?? "State"
        CityLabel.text = selectedCity ?? "City"
        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SagueToCountry" {
            if let destinationVC = segue.destination as? LocationVC {
                destinationVC.buttonClicked = "CountryButton"
            }
        } else if segue.identifier == "SagueToState" {
            if let destinationVC = segue.destination as? LocationVC {
                destinationVC.buttonClicked = "StateButton"
                destinationVC.selectedCountry = CountryLabel.text
            }
        } else if segue.identifier == "SagueToCity" {
            if let destinationVC = segue.destination as? LocationVC {
                destinationVC.buttonClicked = "CityButton"
                destinationVC.selectedCountry = CountryLabel.text
                destinationVC.selectedState = StateLabel.text
                destinationVC.state = StateLabel.text
            }
        }
    }

    
    
    
    @IBAction func SagueToCountry(_ sender: UIButton) {
        performSegue(withIdentifier: "SagueToCountry", sender: nil)
    }
    
    @IBAction func SagueToState(_ sender: UIButton) {
        if CountryLabel.text == "Country"{
            let alert = UIAlertController(title: "Please", message: "Select Country First!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        performSegue(withIdentifier: "SagueToState", sender: nil)
    }
    
    
    @IBAction func SagueToCity(_ sender: UIButton) {
        if StateLabel.text == "State"{
            let alert = UIAlertController(title: "Please", message: "Select State First!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        performSegue(withIdentifier: "SagueToCity", sender: nil)
    }
    
    
    
    
    
    
    
    @IBAction func SaveUerInfo(_ sender: UIButton) {
        DataBaseManager.shared.saveUserData(name: NameText.text!, country: CountryLabel.text!, state: StateLabel.text!, city: CityLabel.text!, email: EmailText.text!, dob: DOBPicker.date, entity: "User")
        let alert = UIAlertController(title: "Successful", message: "Successfully Saved User Info!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: "")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
