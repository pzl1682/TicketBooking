//
//  CityVC.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit

class CityVC: UIViewController {

    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = [String]()
    var selectedCity: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let path = Bundle.main.path(forResource: "StatesAndCities", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: path!)
        for (_, city) in dic!{
            if let c = city as? [String] {
                print(c)
                cities.append(contentsOf: c)
            }
        }
        cities.sort()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        defaults.set(selectedCity, forKey: "City")
        
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
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

extension CityVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(cities)
        let CityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        CityCell.CityLabel.text = cities[indexPath.row]
        return CityCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cities"
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = cities[indexPath.row]
    }
    
    
}

