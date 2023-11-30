//
//  BusyMembers.swift
//  Dawriyah
//
//  Created by Renad Alqarni on 30/11/2023.
//

import SwiftUI

struct BusyMembers: View {
    var body: some View {
        NavigationView{
            
            VStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width:350,height: 1)
                    .padding(.vertical,-300)
                
                Button {
                    Text("add user")
                                    } label: {
                                        Image(systemName: "plus.app").foregroundColor(Color("Color2"))
                                            .bold()
                                    }.offset(x: 150, y: -330)
                
                Text("Looks like this day is free !")
                    .foregroundColor(.gray)
                    .font(.title)
                
                
                
                
            }.navigationTitle("Busy Members")
            
            
            
        }
        
    }
}
#Preview {
    BusyMembers()
}
