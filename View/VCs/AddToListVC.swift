//
//  AddToListVC.swift
//  BucketList
//
//  Created by Nader Said on 10/01/2022.
//

import UIKit
protocol addToList
{
    func addToList(item: BucketListItem)
}

class AddToListVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var delegate : addToList?

    //MARK: - IBOutlet
    
    @IBOutlet weak var descriptionTF: UITextView!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var addBTN: UIButton!
    {
        didSet
        {
            addBTN.layer.borderWidth = 1
            addBTN.layer.borderColor = UIColor.black.cgColor
            addBTN.layer.cornerRadius = addBTN.frame.height / 5
        }
    }
    //MARK: - IBAction
    
    @IBAction func addBTN(_ sender: Any) {
        if titleTF.text != "" && descriptionTF.text != ""
        {
            delegate?.addToList(item: BucketListItem(itemTitle: titleTF.text!, description: descriptionTF.text!))
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Enter title and description properly", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
