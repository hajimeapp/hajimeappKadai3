//
//  ContentView.swift
//  Kadai3
//
//  Created by Hajime on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var typedLeftNumber = ""
    @State var typedRightNumber = ""
    @State var leftSwitcher = false
    @State var rightSwitcher = false
    @State var fixedLeftNumber = 0
    @State var fixedRightNumber = 0
    @State var resultNumber = 0
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("", text: $typedLeftNumber, prompt: Text(""))
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    HStack {
                        Text("+")
                        Toggle("", isOn: $leftSwitcher)
                        Text("-")
                    }
                }
                .padding(10)
                VStack {
                    TextField("", text: $typedRightNumber, prompt: Text(""))
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    HStack {
                        Text("+")
                        Toggle("", isOn: $rightSwitcher)
                        Text("-")
                    }
                }
                .padding(10)
            }
            Button {
                fixOperation()
                calculate()
                if typedLeftNumber == "" {
                    typedLeftNumber = String(0)
                }
                if typedRightNumber == "" {
                    typedRightNumber = String(0)
                }
            } label: {
                Text("Button")
            }
            .padding(10)
            
            HStack {
                Text(String(fixedLeftNumber))
                    .padding(.trailing, 50)
                Text("+")
                Text(String(fixedRightNumber))
                    .padding(.leading, 50)
            }
            Text(String(resultNumber))
                .padding()
            Spacer()
        }
        .padding(.trailing, 150)
    }
    
    func fixOperation() {
        let intLeftNumber = Int(typedLeftNumber) ?? 0
        let intRightNumber = Int(typedRightNumber) ?? 0

        if leftSwitcher {
            fixedLeftNumber = -intLeftNumber
        } else {
            fixedLeftNumber = intLeftNumber
        }
        
        if rightSwitcher {
            fixedRightNumber = -intRightNumber
        } else {
            fixedRightNumber = intRightNumber
        }
    }
    
    func calculate() {
        resultNumber = fixedLeftNumber + fixedRightNumber
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
