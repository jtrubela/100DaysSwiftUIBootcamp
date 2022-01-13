//
//  AddView.swift
//  iExpense
//
//  Created by Justin Trubela on 1/11/22.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @ObservedObject var businessExpenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal", ]
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount,
                          format:.currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new Expense")
            .toolbar {
                Button("Save") {
                    if type == "Personal" {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                    }
                    else {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        businessExpenses.items.append(item)
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), businessExpenses: Expenses())
    }
}
