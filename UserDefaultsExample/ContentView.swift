//
//  ContentView.swift
//  UserDefaultsExample
//
//  Created by Stefan Bayne on 11/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY_STRING") ?? ""
    @State var input: String = ""
    
    let thisBackground = LinearGradient(colors: [.white,.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Enter text to count:")) {
                    TextField("Add any input you would like to Save: ", text: $input)
                }
                
                Section(header: Text("Letter Count ")) {
                    let countLetters = input.filter{ $0 != " " }.count
                    
                    if(countLetters > 30) {
                        Text(String(countLetters)).foregroundColor(Color.purple)
                    } else {
                        input == "" ? Text("Waiting...") : Text(String(countLetters)).foregroundColor(.blue)
                        
                    }
                }
                
                Section(header: Text("Events")) {
                    Button("Save User Data") {
                        UserDefaults.standard.set(input, forKey: "TEXT_KEY_STRING")
                        text = input
                        print("Saved value: \(input)")
                    }
                }
                Section(header: Text("Saved Data:")) {
                    Text(text).lineLimit(5)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
