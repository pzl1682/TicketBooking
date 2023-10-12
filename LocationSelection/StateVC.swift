//
//  StateVC.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit

class StateVC: UIViewController {

    let defaults = UserDefaults.standard
    

    @IBOutlet weak var tableView: UITableView!
    
    var states = [String]()
    var selectedState: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let path = Bundle.main.path(forResource: "StatesAndCities", ofType: "plist")
        let dic = NSDictionary(contentsOfFile: path!)
        states = dic?.allKeys as! [String]
        states.sort()
        print(states)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        defaults.set(selectedState, forKey: "State")
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

extension StateVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(states)
        let StateCell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath) as! StateCell
        StateCell.StateLabel.text = states[indexPath.row]
        return StateCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "States"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedState = states[indexPath.row]
    }
    
    
}
