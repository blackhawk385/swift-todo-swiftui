//
//  ChecklistItem.swift
//  ToDoList
//
//  Created by VenD on 1/1/23.
//

import Foundation

    //    @State var checklistItems = [
    //     "Take vocal lessons",
    //     "Record hit single",
    //     "Learn every martial art",
    //     "Design costume",
    //     "Design crime-fighting vehicle",
    //     "Come up with superhero name",
    //     "Befriend space raccoon",
    //     "Save the world",
    //     "Star in blockbuster movie",
    //    ]
        
struct ChecklistItem : Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
