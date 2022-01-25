//
//  ListItem.swift
//  BucketList
//
//  Created by Nader Said on 14/01/2022.
//

import Foundation
struct BucketListItem : Codable
{
    private(set) var itemTitle : String
    private(set) var description : String
    private(set) var isAchieved : Bool = false
    
    init(itemTitle: String, description: String) {
        self.itemTitle = itemTitle
        self.description = description
    }
    mutating func toggleAchieved() {
        isAchieved = !isAchieved
    }
}

