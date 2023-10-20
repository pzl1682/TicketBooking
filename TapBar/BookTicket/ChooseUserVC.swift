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
    var selectedUser: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchUsersData()
//        for user in users{
//            print(user as User)
//        }
        // Do any additional setup after loading the view.
    }
    

    
    func fetchUsersData(){
        if let fetch = DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: "") as? [User]{
            users = fetch
        }
    }
    
    @IBAction func SegueToUserDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToUserDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectedUser == nil {
            let failalert = UIAlertController(title: "Alert", message: "Select a user to view detail!", preferredStyle: .alert)
            failalert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(failalert, animated: true, completion: nil)
        }
        else if let destinationVC = segue.destination as? UserDetailVC{
            destinationVC.name = selectedUser
            if let fetch = DataBaseManager.shared.fetchUserData(entity: "User", nameSearch: selectedUser!) as? [User]{
                destinationVC.user = fetch
            }
        }
    }
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
        let user = self.users![indexPath.row]
        selectedUser = user.name
//        print(selectedUser)
//        print(indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let removePerson = self.users[indexPath.row].name
            self.users.remove(at: indexPath.row)
            DataBaseManager.shared.deleteUserData(entity: "User", name: removePerson!)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
        
    }
    
    
}

