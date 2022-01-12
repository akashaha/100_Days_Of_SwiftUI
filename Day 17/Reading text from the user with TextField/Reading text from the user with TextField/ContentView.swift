//
//  ContentView.swift
//  Reading text from the user with TextField
//
//  Created by Arman Akash on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var checkAmont = 0.0
    
    //MARK: - BODY
    var body: some View {
        Form {
            Section {
                TextField("Amont",value: $checkAmont,format:.currency(code:  Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
            } //: Section
            Section{
                Text(checkAmont,format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        } //: FORM
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
