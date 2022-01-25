//
//  TVCell.swift
//  BucketList
//
//  Created by Nader Said on 10/01/2022.
//

import UIKit

class BucketCell: UITableViewCell {

    //MARK: - IBOutlet(s)
    @IBOutlet weak var backView: UIView!
    {
        didSet
        {
            backView.layer.cornerRadius = backView.frame.height/5
            backView.layer.borderColor = UIColor.black.cgColor
            backView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var upPriority: UIButton!
    @IBOutlet weak var downPriority: UIButton!
    @IBOutlet weak var achievedSwitch: UISwitch!
    @IBOutlet weak var titleLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func achievedSwitchClicked(_ sender: UISwitch) {
       
    }


}
