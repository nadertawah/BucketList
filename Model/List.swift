//
//  List.swift
//  BucketList
//
//  Created by Nader Said on 09/01/2022.
//

import Foundation
import Metal

struct List<ListItem> where ListItem : Codable
{
    private(set) var listArr = [ListItem]()
    
    mutating func addToList(item: ListItem)
    {
        listArr.append(item)
    }
    
    mutating func removeItem(index: Int)
    {
        listArr.remove(at: index)
    }
    mutating func swapItems(firstIndex: Int, secondIndex:Int)
    {
        let temp = listArr[firstIndex]
        listArr[firstIndex] = listArr[secondIndex]
        listArr[secondIndex] = temp
    }
    func saveData(key : String)
    {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode
            let data = try encoder.encode(listArr)

            // Set Data
            UserDefaults.standard.set(data, forKey: key)
        }
        catch
        {
            print(error)
        }
    }
    mutating func loadData(key : String)
    {
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: key)
        {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                self.listArr = try decoder.decode([ListItem].self, from: data)
            }
            catch
            {
                print(error)
            }
        }
    }
    
    mutating func toggleBucketListAchieved(itemIndex:Int) where ListItem == BucketListItem
    {
        listArr[itemIndex].toggleAchieved()
    }
}


