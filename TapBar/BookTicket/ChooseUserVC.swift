//
//  ChooseUserVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/15/23.
//

import UIKit
import CoreData

class ChooseUserVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users:[User]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        fetchUserData()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchUserData(){
        if let fetch = DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: "") as? [User]{
            users = fetch
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


extension ChooseUserVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let UserCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = self.users![indexPath.row]
        UserCell.UserNameLabel.text = user.name
        return UserCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User list"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

    }
    
    
    
}

