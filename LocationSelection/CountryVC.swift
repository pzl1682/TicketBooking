//
//  CountryVC.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit

class CountryVC: UIViewController {
    
    let defaults = UserDefaults.standard

    
    @IBOutlet weak var tableView: UITableView!
    

    var countries = [String]()
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let path = Bundle.main.path(forResource: "Country", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: path!)
        countries = dic!.object(forKey: "name") as! [String]
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        defaults.set(selectedCountry, forKey: "Country")
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


extension CountryVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(countries)
        let CountryCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        CountryCell.CountryLabel.text = countries[indexPath.row]
        return CountryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Countries"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
    }
    
}
