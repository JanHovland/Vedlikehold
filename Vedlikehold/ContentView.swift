//
//  ContentView.swift
//  Vedlikehold
//
//  Created by Jan Hovland on 21/10/2019.
//  Copyright © 2019 Jan Hovland. All rights reserved.
//

// Short cuts made by me:
// Ctrl + Cmd + / (on number pad)  == Comment or Uncomment
// Ctrl + Cmd + * (on number pad)  == Indent

import SwiftUI

struct ContentView : View {
    
    @State private var firstName: String = ""
    @State var lastName: String = ""
    @State var personEmail: String = ""
    @State var address: String = ""
    @State var phoneNumber: String = ""
    @State var city: String = ""
    @State var municipality: String = ""
    // @State var dateOfBirth: String = ""
    
    @State var gender = 0
    var genders = ["Man", "Women"]
    
    @State var dateOfBirth = Date()
    
    var body: some View {
        NavigationView {
            Form {
                
                InputTextField(heading: "First name",   placeHolder: "Enter the first name",    value: $firstName)
                InputTextField(heading: "Last name",    placeHolder: "Enter the last name",     value: $lastName)
                InputTextField(heading: "eMail",        placeHolder: "Enter the email address", value: $personEmail)
                InputTextField(heading: "Address",      placeHolder: "Enter the address",       value: $address)
                InputTextField(heading: "Phone Number", placeHolder: "Enter the phone number",  value: $phoneNumber)
                
                HStack {
                    InputTextField(heading: "City", placeHolder: "Enter the city", value: $city)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.blue)
                        // .font(Font.system(.title).bold())
                        // .font(Font.system(.headline))
                        // .font(Font.system(.title))
                        .font(.title)
                }
                
                InputTextField(heading: "Municipality", placeHolder: "Enter the municipality",  value: $municipality)
                
                DatePicker(
                    selection: $dateOfBirth,
                    in: ...Date(),
                    displayedComponents: [.date],
                    label: {
                        Text("Date of birth")
                            .font(.footnote)
                            .padding(-5)
                    }
                )
                
                // Returning an inteher 0 == "Man" 1 == "Women
                InputGender(heading: "Gender ", genders: genders, value: $gender)
                
            }
            .navigationBarTitle(Text("Personal information"), displayMode: .inline)

        }
            // Removes all separators below in the List view
            .listStyle(GroupedListStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InputTextField: View {
    var heading: String
    var placeHolder: String
    @Binding var value: String
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Text(heading)
                    .font(.footnote)
                    .padding(-5)
                TextField(placeHolder, text: $value)
                    .padding(-7)
                    .padding(.horizontal, 15)
            }
        }
    }
}

struct InputGender: View {
    var heading: String
    var genders: [String]
    @Binding var value: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(heading)
                    .font(.footnote)
                    .padding(-5)
                Picker(selection: $value, label: Text("")) {
                    ForEach(0..<genders.count) { index in
                        Text(self.genders[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}
  
//func changeSwitchPassword(_ sender: UISwitch) {
//
//     if switchPassWord.isOn == false {
//         switchPassWord.isOn = false
//         UserDefaults.standard.set(false, forKey: "SHOWPASSWORD")
//     } else {
//         switchPassWord.isOn = true
//         UserDefaults.standard.set(true, forKey: "SHOWPASSWORD")
//     }
//
// }

