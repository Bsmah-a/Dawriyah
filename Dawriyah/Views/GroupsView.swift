//
//  GroupsView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 14/05/1445 AH.
//

import SwiftUI

struct GroupsView: View {
    
    @State private var isShowingProfileSheet = false
    
    let groupName:[String]=["family", "Friends1", "Friend2"]
    let peoples:[ peopleInfo] = [
        peopleInfo(emoji: 1, name: "Renad"),
        peopleInfo(emoji: 2, name: "Basemah"),
        peopleInfo(emoji: 3, name: "Reema"),
        peopleInfo(emoji: 1, name: "Taif"),
        peopleInfo(emoji: 1, name: "Sara")
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                
                /* Button(action:{
                 isShowingProfileSheet.toggle()
                 }) {
                 Image(systemName: "person.circle").font(.largeTitle).foregroundColor(Color("Color2")).padding(.top, -76.0).padding(.leading, 290.0)}
                 
                 .sheet(isPresented: $isShowingProfileSheet) {
                 ProfileSheet()
                 }*/
                
                ScrollView{
                    
                    HStack{Spacer()}
                    ForEach(groupName, id: \.self) { group in
                        NavigationLink {
                            CalendarPage()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 312, height: 140).foregroundColor(Color("Color2")).opacity(0.40)
                                VStack(alignment: .leading, spacing: 20){
                                    Text(group).padding(.leading, 15.0).foregroundColor(Color("TitleC")).bold().font(.title2)
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 300, height: 2).foregroundColor(.gray).opacity(0.30)
                                    
                                    HStack(spacing:-20){
                                        ForEach(peoples) { person in
                                            Image("memoji\(person.emoji)")}
                                        
                                        Image(systemName: "chevron.right").padding(.leading,90).foregroundColor(Color("Color2"))
                                    }
                                    .padding(.leading, 20.0)
                                }
                            }
                        }


                    }
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 312, height: 125).foregroundColor(Color("Color2")).opacity(0.40)
                        NavigationLink(destination: CreateView()){
                            Image(systemName: "plus.circle").font(.system(size: 60)).foregroundColor(Color("Color2")).opacity(0.40)}
                    }
                    
                    Spacer()
                }.padding(.top, 40.0)
            }.navigationTitle("Dawriyah Groups") .toolbar {
                Button(action:{
                    isShowingProfileSheet.toggle()
                }) {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                        .foregroundColor(Color("Color2"))
                }
                .sheet(isPresented: $isShowingProfileSheet) {
                    ProfileSheet()}
            }
            
            
            .background{Color("backg").ignoresSafeArea()
            }
            
        }.accentColor(Color("Color2"))
        
    }
}
#Preview {
    GroupsView()
}
