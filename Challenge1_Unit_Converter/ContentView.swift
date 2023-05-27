//
//  ContentView.swift
//  Challenge1_Unit_Converter
//
//  Created by Brian Tavares on 5/26/23.
//
// Unit converter for length meters, kilometers, feet, yards, miles

import SwiftUI

struct ContentView: View {
    @State private var sourcelength = 0.0
    @State private var sourceUnitSelection = "Feet"
    @State private var destinationUnitSelection = "Meters"
    @FocusState private var sourceUnitIsFocused: Bool
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    // Computed property for the converted units
    var convertedLength: Double {
        // Convert the value to the s elected units
        let sourceUnit = sourceUnitSelection
        let destUnit = destinationUnitSelection
        let enteredValue = sourcelength
        
        
        switch sourceUnit{
            case "Meters":
                switch destUnit {
                    case "Meters":
                        return enteredValue
                    
                    case "Kilometers":
                        return enteredValue/1000
                    
                    case "Feet":
                        return enteredValue * 3.281
                    
                    case "Yards":
                        return enteredValue * 1.094
                    
                    case "Miles":
                        return enteredValue / 1609
                    
                    default:
                        return enteredValue
                }
                
            case "Kilometers":
                switch destUnit {
                    case "Meters":
                        return enteredValue * 1000
                    
                    case "Kilometers":
                        return enteredValue
                    
                    case "Feet":
                        return enteredValue * 3281
                    
                    case "Yards":
                        return enteredValue * 1094
                    
                    case "Miles":
                        return enteredValue / 1.609
                    
                    default:
                        return enteredValue
                }
            
            case "Feet":
                switch destUnit {
                    case "Meters":
                        return enteredValue / 3.281
                    
                    case "Kilometers":
                        return enteredValue / 3281
                    
                    case "Feet":
                        return enteredValue
                    
                    case "Yards":
                        return enteredValue / 3
                     
                    case "Miles":
                        return enteredValue / 5280
                    
                    default:
                        return enteredValue
                }
            
            case "Yards":
                switch destUnit {
                    case "Meters":
                        return enteredValue / 1.094
                    
                    case "Kilometers":
                        return enteredValue / 1094
                    
                    case "Feet":
                        return enteredValue * 3
                    
                    case "Yards":
                        return enteredValue
                     
                    case "Miles":
                        return enteredValue / 1760
                    
                    default:
                        return enteredValue
                }
            
            case "Miles":
                switch destUnit {
                    case "Meters":
                        return enteredValue * 1609
                    
                    case "Kilometers":
                    return enteredValue * 1.609
                    
                    case "Feet":
                        return enteredValue * 5280
                    
                    case "Yards":
                        return enteredValue * 1760
                     
                    case "Miles":
                        return enteredValue
                    
                    default:
                        return enteredValue
                }
            
            default:
                return enteredValue
            
        }
        
        
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Length to be converted", value: $sourcelength, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($sourceUnitIsFocused)
                    
                    Picker("Units to convert from", selection: $sourceUnitSelection){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Units to convert from")
                }
                
                
                Section{
                    Picker("Units to convert to", selection: $destinationUnitSelection){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    //Text("\(convertedLength, specifier: "%.2f")")
                    Text(convertedLength.formatted())
                } header: {
                    Text("Units to convert To")
                }
            }
            .navigationTitle("Units converter")
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        sourceUnitIsFocused = false
                    }
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
