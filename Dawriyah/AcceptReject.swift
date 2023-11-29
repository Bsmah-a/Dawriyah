//
//  AcceptReject.swift
//  Dawriyah
//
//  Created by Shahad Alzowaid on 15/05/1445 AH.
//

import SwiftUI

struct AcceptReject: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color("backg").ignoresSafeArea()
                
                Image("profile").resizable().scaledToFill().frame(width: 10, height: 60).padding(.bottom,720).padding(.leading, 275)
                    .navigationTitle("Dwriyah Groups").foregroundColor(Color("Color2")).bold()
                
                VStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width:350,height: 1)
                        .padding(.vertical,-310)
                }
            }
        }
    }}

#Preview {
    AcceptReject()
}
