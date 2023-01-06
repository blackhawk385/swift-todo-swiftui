//
//  NewChecklistItemView.swift
//  ToDoList
//
//  Created by VenD on 1/2/23.
//

import SwiftUI

struct NewChecklistItemView: View {
    @State var newItemName = ""
    var checklist: Checklist
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text:
                            $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.item.append(newChecklistItem)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }.disabled(newItemName.count == 0)
                }
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
