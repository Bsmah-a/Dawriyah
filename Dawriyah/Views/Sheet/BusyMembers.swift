//
//  BusyMembers.swift
//  Dawriyah
//
//  Created by Renad Alqarni on 30/11/2023.
//

import SwiftUI

struct BusyMembers: View {
    @Binding var busyMembers: [peopleInfo]
    @State private var isButtonClicked = false
    @State private var currentUserImage: Image = Image("memoji1")

    var body: some View {
        NavigationView{
            
            VStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width:350,height: 1)
                    .padding()
                
                if !isButtonClicked {
                                   Text("Looks like this day is free!")
                                       .foregroundColor(.gray)
                                       .font(.title)
                                       .padding(.top,250)
                               }
                
                Spacer()

                               // Display busy members
                ForEach(busyMembers, id: \.name) { person in
                 HStack(alignment: .top) {
                    Image("memoji\(person.emoji)")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, -10)

                    Text("\(person.name)")
                        .font(.title3)
                        .padding(.top, 5)
                                  }
                              }


                               Spacer()
                
                Button(action:{
                    // Remove the current user from the busy members list
                    if let index = busyMembers.firstIndex(where: { $0.name == "Renad" }) {
                        busyMembers.remove(at: index)
                    }
                    isButtonClicked = false
                }) {
                    Text("Remove myself")
                        .foregroundColor(Color("Color2"))
                        .padding(.top,85)
                }
            }.navigationTitle("Busy Members").toolbar {
                Button(action:{
                    let currentUser = peopleInfo(emoji: 2, name: "Renad") // Replace with the actual user data
                     busyMembers.append(currentUser)
                    isButtonClicked = true
                }) {
                    Image(systemName: "plus.app")
                        .font(.largeTitle)
                        .foregroundColor(Color("Color2"))
                        .padding(.top,85)
                }

                
            }
             }
 
    }
}

struct BusyMembers_Previews_Previews: PreviewProvider {
    static var previews: some View {
        let dummyMembers: [peopleInfo] = []

        return BusyMembers(busyMembers: .constant(dummyMembers))
            .previewLayout(.sizeThatFits)
    }
}

