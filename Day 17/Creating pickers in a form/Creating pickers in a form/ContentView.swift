//
//  ContentView.swift
//  Creating pickers in a form
//
//  Created by Arman Akash on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: -PROPERTIES
    @State private var checkAmount : Double = 0.0
    @State private var selectedparsentage : Int =  20
    let tipPersentageArray = [10,15,20,30,0]
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amont",value: $checkAmount,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    
                    // picker
                    Picker("Tip persantage: ",selection: $selectedparsentage){
                        ForEach(tipPersentageArray, id: \.self){ value in
                            Text("\(value)")
                        }
                    }
                    
                } //: Section
                Section{
                    Text("Text")
                } //: Section
            }  //: Form
            .navigationTitle("WeSplit")
        }  //: NavigationView
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
