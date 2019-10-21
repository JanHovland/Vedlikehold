//
//  ContentView.swift
//  Vedlikehold
//
//  Created by Jan Hovland on 21/10/2019.
//  Copyright © 2019 Jan Hovland. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var firstName: String = ""
    @State var lastName: String = ""
    @State var personEmail: String = ""
    @State var address: String = ""
    @State var phoneNumber: String = ""
    @State var city: String = ""
    @State var municipality: String = ""
    @State var dateOfBirth: String = ""
    
    @State private var gender = 0
    var genders = ["Man", "Women"]

    var body: some View {
        NavigationView {
            Form {
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("First name")
                               .font(.footnote)
                               .padding(-3)
                            TextField("Enter the first name", text: $firstName)
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("Last name")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the last name", text: $lastName)
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("eMail")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the email address", text: $personEmail)
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("Address")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the address", text: $address)
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("Phone Number")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the phone number", text: $phoneNumber)
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("city")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the city", text: $city)
                                                   }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("Municipality")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the municipality", text: $municipality)
                            .fixedSize()
                        }
                    }
                    
                    ZStack {
                        VStack (alignment: .leading) {
                            Text("Date of birth")
                               .font(.footnote)
                               .padding(-5)
                            TextField("Enter the dateOfBirth", text: $dateOfBirth)
                        }
                    }
                
                    VStack {
                        HStack {
                            Text("Gender")
                            .font(.footnote)
                            .padding(-5)
                            Picker(selection: $gender, label: Text("")) {
                                ForEach(0..<genders.count) { index in
                                    Text(self.genders[index]).tag(index)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(5)
                        }
                    
                    }
            }
                
             
            .navigationBarTitle(Text("Person opplysninger"), displayMode: .inline)
            .padding(-5)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
