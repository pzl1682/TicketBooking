//
//  LocationVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/15/23.
//

import UIKit

class LocationVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var buttonClicked: String!
    var state: String!
    var city: String!


    var countries = [String]()
    var states = [String]()
    var cities = [String]()
    
    var selectedCountry: String?
    var selectedState: String?
    var selectedCity: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(buttonClicked)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let path1 = Bundle.main.path(forResource: "Country", ofType: "plist")
        let countryDic = NSDictionary(contentsOfFile: path1!)
        countries = countryDic!.object(forKey: "name") as! [String]
        
        let path2 = Bundle.main.path(forResource: "StatesAndCities", ofType: "plist")
        let stateAndCityDic = NSDictionary(contentsOfFile: path2!)
        states = stateAndCityDic!.allKeys as! [String]
        states.sort()

        cities = stateAndCityDic![state ?? "New York"] as! [String]
        cities.sort()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueBackToInfo", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueBackToInfo" {
            if let destinationVC = segue.destination as? UserInfoInputVC {
                switch buttonClicked{
                case "CountryButton":
                    destinationVC.selectedCountry = selectedCountry
                case "StateButton":
                    destinationVC.selectedCountry = selectedCountry
                    destinationVC.selectedState = selectedState
                case "CityButton":
                    destinationVC.selectedCountry = selectedCountry
                    destinationVC.selectedState = selectedState
                    destinationVC.selectedCity = selectedCity
                default:
                    print("Error")
                }

            }
        }
    }



}


extension LocationVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var length: Int!
        switch buttonClicked{
        case "CountryButton":
            length = countries.count
        case "StateButton":
            length = states.count
        case "CityButton":
            length = cities.count
        default:
            length = 0
        }
        return length
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var text = ""
        switch buttonClicked{
        case "CountryButton":
            text = countries[indexPath.row]
        case "StateButton":
            text = states[indexPath.row]
        case "CityButton":
            text = cities[indexPath.row]
        default:
            text = ""
        }
        
        let LocationCell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        LocationCell.LocationCellLabel.text = text
        return LocationCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch buttonClicked{
        case "CountryButton":
            title = "Country"
        case "StateButton":
            title = "State"
        case "CityButton":
            title = "City"
        default:
            title = "Error"
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch buttonClicked{
        case "CountryButton":
            selectedCountry = countries[indexPath.row]
        case "StateButton":
            selectedState = states[indexPath.row]
        case "CityButton":
            selectedCity = cities[indexPath.row]
        default:
            print("Error")
        }
    }
    
    
    
}
