//
//  BookTicketVC.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/12/23.
//

import UIKit

class BookTicketVC: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SegueToUser(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToUser", sender: nil)
    }
    
    @IBAction func SegueToFlight(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToFlight", sender: nil)
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        
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
