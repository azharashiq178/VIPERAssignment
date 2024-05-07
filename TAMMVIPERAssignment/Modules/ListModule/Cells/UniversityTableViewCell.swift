//
//  UniversityTableViewCell.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.shadow.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowRadius = 1
        mainView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
