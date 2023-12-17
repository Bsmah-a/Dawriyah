//
//  Wheel Demo.swift
//  Dawriyah
//
//  Created by Shahad Alzowaid on 04/06/1445 AH.
//

import SwiftUI

struct Wheel_Demo: View {
    @State var items: [String] = ["A","B","C"]
    @State var textfieldt: String = ""
    var body: some View {
        VStack{
            WheelView( items,
                       id: \.self,
                       label: { index in
                Text (items[index])
                    .font (.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor (.white)
            }
            ) { item in
                print(item)
            }.padding()
            
            TextField(" اكتب تشويقة عن سالفتك:..", text: $textfieldt)
                //.padding(.leading,160)
                .background(Color.gray.opacity(0.2)
                    .cornerRadius(8))
                //.offset(x: 0, y: 320)
            Button(action: {
                self.items.append(textfieldt)
            },label: {
                Text("احفظها !")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Color2"))
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    //.offset(x:0, y:350)
            })
            
        }
    }
}

#Preview {
    Wheel_Demo()
}
