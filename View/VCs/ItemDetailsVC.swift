//
//  ItemDetailsVC.swift
//  BucketList
//
//  Created by Nader Said on 14/01/2022.
//

import UIKit

class ItemDetailsVC: UIViewController {

    var descrip: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionTF.text = descrip
        
    }


    @IBOutlet weak var descriptionTF: UITextView!
}
