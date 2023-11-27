//
//  peopleView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 10/05/1445 AH.
//

import SwiftUI

struct peopleInfo: Identifiable{
    let id: UUID = UUID()
    let emoji: Int
    let name: String
}

struct peopleView: View {
    
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
                                    Text("Add").frame(width: 95,height:40 ).background(Color("Color2")).foregroundColor(.white).cornerRadius(10)
                                
                                }.background(Color("backg"))
                            }
                    
                    NavigationLink(destination: CreateView()) {
                     Text("Create!").padding().frame(width: 229, height: 53).background(Color("Color2")).foregroundColor(.white).cornerRadius(20).bold().font(.headline)
                 }.padding(.top, 30.0)
                        }
              
            }.navigationTitle("add people").foregroundColor(Color("Color2")).bold()
                    
        }.accentColor(Color("Color2"))
            }
        }
              
    /*  */


#Preview {
    peopleView()
}
