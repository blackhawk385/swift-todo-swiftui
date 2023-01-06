    //
    //  ContentView.swift
    //  ToDoList
    //
    //  Created by VenD on 12/29/22.
    //

import SwiftUI

struct CheckListView: View {
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
        //    let indexesToRemove = IndexSet(integersIn: 0...4)
    
    var body: some View {
        NavigationView {
            List {
                    //                ForEach(checklist.item, id: \.self.name) { checklistItem in
                    //                    HStack {
                    //                        RowView(checklistItem: checklistItem)
                    //                    }.background(Color.white)
                    //                        .onTapGesture {
                    //                            if let matchingIndex = checklist.item.firstIndex(where: {
                    //                                $0.id ==  checklistItem.id}) {
                    //                                if(checklist.item[matchingIndex].isChecked == 1){
                    //                                    checklist.item[matchingIndex].isChecked = 0
                    //                                }else {
                    //                                    checklist.item[matchingIndex].isChecked = 1
                    //                                }
                    //
                    //                                checklist.printChecklistContents()
                    //                            }
                    //                        }
                
                ForEach(checklist.item) { index in
                 RowView(checklistItem: self.$checklist.item[index])
               }

                
                .onDelete(perform: checklist.deleteListItem(whichElement:))
                .onMove(perform: checklist.moveListItem(whichElement:destination:))
                
                
            }.navigationBarTitle("TODO LIST", displayMode: .inline)
    
                .navigationBarItems(leading: Button(action: { self.newChecklistItemViewIsVisible =
                    true }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add item")
                        }
                    }.sheet(isPresented: $newChecklistItemViewIsVisible, content: {
                        NewChecklistItemView(checklist: self.checklist)
//                        Alert(title: Text("Add Reminer"), message: Text("Please"), primaryButton: .default(Text("cancel")), secondaryButton: .default(Text("ok")))
                    }), trailing: EditButton())
        }.onAppear(perform: checklist.printChecklistContents)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            CheckListView()
        }
    }
}
