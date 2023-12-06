//
//  GroupsView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 14/05/1445 AH.
//

import SwiftUI

struct GroupsView: View {
    
    @State private var isShowingProfileSheet = false
    
    let groupName:[String]=["Family", "Friends", "University"]
    let peoples:[ peopleInfo] = [
        peopleInfo(emoji: 1, name: "Renad"),
        peopleInfo(emoji: 2, name: "Basemah"),
        peopleInfo(emoji: 3, name: "Reema"),
        peopleInfo(emoji: 1, name: "Taif"),
        peopleInfo(emoji: 1, name: "Sara")
    ]
    
    var body: some View {
        NavigationStack{
            
            VStack {
                           HStack {
                               Text("Dawriyah Groups")
                                   //.font(.largeTitle)
                                   .foregroundColor(Color.black).fontWeight(.regular).font(.system(size: 34))
                                   .offset(y: 6)
                                   .offset(x: 20)
                            
                                  

                               Spacer()

                               Button(action: {
                                   isShowingProfileSheet.toggle()
                               }) {
                                   Image(systemName: "person.circle")
                                       .font(.largeTitle)
                                       .foregroundColor(Color("Color2"))
                                       .offset(x: -24)
                                       .offset(y: 11)
                                       .scaleEffect(0.8)
                                   
                               }
                               .sheet(isPresented: $isShowingProfileSheet) {
                                   ProfileSheet()
                               }
                           }
                           .padding()
                           .background(Color("backg"))
                       }
                       .navigationBarHidden(true)
            
            Rectangle()
                .frame(height: 1) // Adjust the height to make it thicker
                .foregroundColor(Color.gray) // Set the color
                .padding(.horizontal, 40)
                .opacity(0.5)
            
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
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 322, height: 101).foregroundColor(Color("Color2")).opacity(0.40)
                                VStack(alignment: .leading, spacing: 20){
                                    Text(group).padding(.leading, 60.0) .foregroundColor(Color.black).fontWeight(.regular).font(.system(size: 20)).offset(y: 25)
//                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 300, height: 2).foregroundColor(.gray).opacity(0.30)
                                        Divider()
                                        .padding(.horizontal, 50)
                                        .padding(.top, 12)
                                
                                    HStack(spacing:-20){
                                        ForEach(peoples) { person in
                                            Image("memoji\(person.emoji)")}
                                        .offset(y: -20) // Adjust the value to move the images up
                                        .scaleEffect(0.8) // Adjust the value to make the images smaller
                                        .offset(x: 45)
                                        Image(systemName: "chevron.right").padding(.leading,150)  .offset(y:-19).foregroundColor(Color("Color2"))
                                    }
                                    .padding(.leading, 4.0)
                                 
                                    
                                }
                            }
                        }


                    }
                    
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 322, height: 101).foregroundColor(Color("Color2")).opacity(0.40)
                        NavigationLink(destination: CreateView()){
                            Image(systemName: "plus.circle").font(.system(size: 60)).foregroundColor(Color("Color2")).opacity(0.40)}
                        
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }.padding(.top, 10.0)
                
            }
//            .navigationTitle("Dawriyah Groups")
//                .toolbar {
//                Button(action:{
//                    isShowingProfileSheet.toggle()
//                }) {
//                    Image(systemName: "person.circle")
//                        .font(.largeTitle)
//                        .foregroundColor(Color("Color2"))
//                }
//                .sheet(isPresented: $isShowingProfileSheet) {
//                    ProfileSheet()}
//            }
            
            
            .background{Color("backg").ignoresSafeArea()
            }
            
        }
        .accentColor(Color("Color2"))
        
    }
}
#Preview {
    GroupsView()
}
