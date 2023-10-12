//
//  UserInfoInputVC.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit

class UserInfoInputVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func SagueToCountry(_ sender: UIButton) {
        performSegue(withIdentifier: "SagueToCountry", sender: nil)
    }
    

    
    @IBAction func SagueToState(_ sender: UIButton) {
        performSegue(withIdentifier: "SagueToState", sender: nil)
    }

    
    
    @IBAction func SagueToCity(_ sender: UIButton) {
        performSegue(withIdentifier: "SagueToCity", sender: nil)
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
