//
//  UserInfoVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/12/23.
//

import UIKit

class UserInfoVC: UIViewController{
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var users:[User]!
    var selectedUser: User?
    
    override func viewWillAppear(_ animated: Bool) {
        fetchUsersData()
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self


        // Do any additional setup after loading the view.
    }
    
    func fetchUsersData(){
        if let fetch = DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: "") as? [User]{
            users = fetch
        }
    }
    
    
    @IBAction func SegueToTickets(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToTickets", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ShowFlightsVC {
            destinationVC.selectedUser = selectedUser
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


extension UserInfoVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ShowUserCell = tableView.dequeueReusableCell(withIdentifier: "ShowUserCell", for: indexPath) as! ShowUserCell
        let user = self.users![indexPath.row]
        ShowUserCell.UserNameLabel.text = user.name
        return ShowUserCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose a user to view booked flights"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = self.users![indexPath.row]
//        print(selectedUser)
//        print(indexPath.row)
    }
    
    
    
    
}

