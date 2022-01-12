//
//  ContentView.swift
//  WeSplit
//
//  Created by Arman Akash on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State private var checkAmont : Double = 0.0
    @State private var numberOfPeople : Int = 2
    @State private var selectedTipAmont : Int = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipAmonts : [Int] = [10,15,20,25,0]
    
        //
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(selectedTipAmont)
        
        let tipValue = checkAmont / 100 * tipSelection
        let grandTotal = checkAmont + tipValue
        let amontPerPerson = grandTotal / peopleCount
        return  amontPerPerson
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amont: ",value: $checkAmont,format: .currency(code: Locale.current.currencyCode ?? "USD" ))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    
                    Picker("Number of people: ",selection: $numberOfPeople){
                        ForEach(2..<100){customer in
                            Text("\(customer) people")
                        } //: ForEach
                    } //: Picker
                } //: Section
                Section{
                    Picker("How much tip you want to leave?", selection: $selectedTipAmont){
                        ForEach(tipAmonts, id: \.self){value in
                            Text("\(value)%")
                        }
                    } //: Picker
                    .pickerStyle(.segmented)
                } //: Section
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            } //: Form
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        } //: NAvigationView
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
