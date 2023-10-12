//
//  StateCell.swift
//  OfflineTicketBooking
//
//  Created by Zhilin Pan on 10/10/23.
//

import UIKit

class StateCell: UITableViewCell {

    
    @IBOutlet weak var StateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
