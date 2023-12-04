//
//  SplachScreenView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 12/05/1445 AH.
//

import SwiftUI

struct SplachScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            //signInView()
            CalendarView()
        }else{
            ZStack{
                Color("SplashColor").ignoresSafeArea()
                VStack{
                    VStack(spacing : 50){
                        Image("D")
                        Image("DAWRIYAH")
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                        
                          
                    }
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){self.isActive = true}
                }
            }
        }
        
        
    }
}

#Preview {
    SplachScreenView()
}
