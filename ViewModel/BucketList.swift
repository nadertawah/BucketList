//
//  BucketList.swift
//  BucketList
//
//  Created by Nader Said on 09/01/2022.
//

import UIKit

class BucketList
{
    private(set) var model = Dynamic(List<BucketListItem>())

    // MARK: - Intent(s)
    func addBucketItem(bucketItem: BucketListItem)  {
        model.value.addToList(item: bucketItem)
        saveData()
    }
    func removeBucketItem(itemIndex:Int)
    {
        model.value.removeItem(index: itemIndex)
        saveData()
    }
    func swapItems(firstIndex: Int, secondIndex:Int)
    {
        model.value.swapItems(firstIndex: firstIndex, secondIndex: secondIndex)
        saveData()
    }
    func toggleAchieved(itemIndex:Int){
        model.value.toggleBucketListAchieved(itemIndex: itemIndex)
        saveData()
    }
    
    
    // MARK: - Helper Funcs
    func getListArray() -> [BucketListItem]
    {
        return model.value.listArr
    }
    func saveData()
    {
        model.value.saveData(key: UserDefaults.Keys.bucketListKey)
    }
    func loadData()
    {
        model.value.loadData(key: UserDefaults.Keys.bucketListKey)
    }
    
}
