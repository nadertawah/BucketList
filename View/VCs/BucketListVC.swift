//
//  ViewController.swift
//  BucketList
//
//  Created by Nader Said on 09/01/2022.
//

import UIKit

class BucketListVC: UIViewController {

    //MARK: - IBOutlet(s)
    @IBOutlet weak var tableView: UITableView!
    
    var list = BucketList()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind viewmodel array to tableview
        list.model.bind(){ _ in self.tableView.reloadData()}
        
        //load Data
        list.loadData()
    }
    
    //MARK: - IBAction
    @IBAction func addBtn(_ sender: Any) {
        let addToListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddToListVC") as! AddToListVC
        addToListVC.delegate = self
        self.navigationController?.pushViewController(addToListVC, animated: true)
        addToListVC.navigationController?.navigationBar.tintColor = .white
    }
}

extension BucketListVC : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.getListArray().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell") as! BucketCell
        let item = list.getListArray()[indexPath.row]
        
        cell.titleLBL.text = item.itemTitle
        
        cell.upPriority.tag = indexPath.row
        cell.upPriority.addTarget(self, action: #selector(self.upPriorityPressed), for: .touchUpInside)
        
        cell.downPriority.tag = indexPath.row
        cell.downPriority.addTarget(self, action: #selector(self.downPriorityPressed), for: .touchUpInside)
        
        cell.achievedSwitch.isOn = item.isAchieved
        cell.achievedSwitch.tag = indexPath.row
        cell.achievedSwitch.addTarget(self, action: #selector(self.achievedSwitchPressed), for: .touchUpInside)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemDetailsVC") as! ItemDetailsVC
        detailsVC.descrip = list.getListArray()[indexPath.row].description
        self.navigationController?.pushViewController(detailsVC, animated: true)
        detailsVC.navigationController?.navigationBar.tintColor = .white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.BuckListCellHeight
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete")
        {
            _,_,_ in
            self.list.removeBucketItem(itemIndex: indexPath.row)
        }
        delete.image = UIImage(systemName: "xmark.bin.fill")
        let swipe =  UISwipeActionsConfiguration(actions: [delete])
        swipe.performsFirstActionWithFullSwipe = false
        return swipe
    }
    
    @objc func upPriorityPressed(_ sender: UIButton)
    {
        if(sender.tag != 0)
        {
            list.swapItems(firstIndex: sender.tag, secondIndex: sender.tag - 1)
        }
    }
    @objc func downPriorityPressed(_ sender: UIButton)
    {
        if(sender.tag != list.model.value.listArr.count - 1)
        {
            list.swapItems(firstIndex: sender.tag, secondIndex: sender.tag + 1)
        }
    }
    @objc func achievedSwitchPressed (_ sender: UISwitch)
    {
        list.toggleAchieved(itemIndex: sender.tag)
    }
    
}

extension BucketListVC : addToList
{
    func addToList(item: BucketListItem) {
        list.addBucketItem(bucketItem: item)
    }
}
