//
//  ContentView.swift
//  Adding a segmented control for tip percentages
//
//  Created by Arman Akash on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var checkAmont = 0.0
    @State private var tipPersentages = 20
    @State private var numberOfPeople = 4
    let tipPersentage = [10,15,20,25,30,0]
    
    var totalPerPerson : Double{
        // calculate total per person
        let  peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPersentages)
        let tipValue = checkAmont / 100 * tipSelection
        let grandTotal = tipValue + checkAmont
        let amountperPerson = grandTotal / peopleCount
        
        return amountperPerson
    }
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amont : ",value: $checkAmont,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of person: ",selection: $numberOfPeople){
                        ForEach(2..<10){ value in
                            Text("\(value)")
                        }
                    } //: PickerView
                       
                } //: Section
                Section{
                    Text("How much tip you want to leave?")
                    Picker("Tip persentage :",selection: $tipPersentages){
                        ForEach(tipPersentage, id: \.self){ persentage in
                            Text("\(persentage)%")
                        }
                    }.pickerStyle(.segmented)
                } //: Section
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } //: Section
            } //: Form
            .navigationTitle("WeSplit")
        } //: NavigationView
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
