//
//  peopleView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 10/05/1445 AH.
//

import SwiftUI



struct peopleView: View {
    
    @State private var isAddingPeople = true
    @State private var peoples:[ peopleInfo] = []
    @State var peopleDic: [peopleInfo:Bool] = [:]
   
    let people:[ peopleInfo] = [
        peopleInfo(emoji: 1, name: "Renad"),
        peopleInfo(emoji: 2, name: "Basemah"),
        peopleInfo(emoji: 3, name: "Reema"),
        peopleInfo(emoji: 1, name: "Taif"),
        peopleInfo(emoji: 1, name: "Sara"),
        peopleInfo(emoji: 2, name: "Basemah"),
        peopleInfo(emoji: 3, name: "Reema"),
        peopleInfo(emoji: 1, name: "Taif"),
        peopleInfo(emoji: 3, name: "Saraa")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("backg").ignoresSafeArea()
                VStack{
                HStack(spacing: 30){
                    RoundedRectangle (cornerRadius: 25).fill(Color("Color2")).frame(width: 150, height: 4)
                
                RoundedRectangle(cornerRadius: 25).fill(Color("Color2")).frame(width: 150, height: 4).padding()
                }
                   ScrollView(.horizontal){
                        HStack(spacing: 10){
                            ForEach(people) { person in
                                Image("memoji\(person.emoji)")}
                        }
                    }.padding()
                            List(people){peopleInfo in
                                HStack{
                                Image("memoji\(peopleInfo.emoji)")
                                 
                                Text(peopleInfo.name)
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        
                                        peopleDic[peopleInfo]?.toggle()
                                       // if isAddingPeople {
                     // Simulating CloudKit record addition
                    // let newPerson = peopleInfo(emoji: 4, name: "New Person")
                          //   peoples.append(newPerson)
                                            
                       // Call CloudKit function to add newPerson to  CloudKit database
                     // Example: cloudKitManager.addPersonToCloudKit(newPerson)
                                      //  }
//                                        isAddingPeople.toggle()
                                    }, label: {
                                        if !(peopleDic[peopleInfo] ?? false){
                                            Image(systemName: "plus.circle.fill").foregroundColor(.gray).opacity(0.5).font(.title).background(Color.white).cornerRadius(15)
                                                     } else {
                                                         Image(systemName: "checkmark.circle.fill")
                                                             .foregroundColor(.green).opacity(0.8).font(.title).background(Color.white).cornerRadius(15)}})}.background(Color("backg"))}
                    
                    NavigationLink(destination: GroupsView()) {
                     Text("Create!").padding().frame(width: 229, height: 53).background(Color("Color2")).foregroundColor(.white).cornerRadius(20).bold().font(.headline)
                 }.padding(.top, 30.0)
                        }
              
            }.navigationTitle("add people").foregroundColor(Color("Color2")).bold()
                    
        }.accentColor(Color("Color2"))
            .onAppear{
                self.people.forEach { person in
                    self.peopleDic[person] = false
                }
                
            }
            
            }
    
        }
              
  


#Preview {
    peopleView()
}
