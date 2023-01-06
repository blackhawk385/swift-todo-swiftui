//
//  RowView.swift
//  ToDoList
//
//  Created by VenD on 1/2/23.
//

import SwiftUI

struct RowView: View {
    @Binding var checklistItem: ChecklistItem
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: self.$checklistItem)){
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked == true ? "Completed" : "inComplete")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}

