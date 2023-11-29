//
//  CustomDialog.swift
//  Dawriyah
//
//  Created by Shahad Alzowaid on 15/05/1445 AH.
//

import SwiftUI

struct CustomDialog: View {
    var message: String
    var rejectAction: () -> Void
    var acceptAction: () -> Void
    
    var body: some View {
        VStack {
            Text(message)
                .font(.headline)
                .padding()
            
            HStack {
                Button(action: {
                    rejectAction()
                }) {
                    Text("Reject")
                        .foregroundColor(.white).background(Color("SplashColor"))
                }
                .padding()
                
                Button(action: {
                    acceptAction()
                }) {
                    Text("Accept")
                        .foregroundColor(.white).background(Color("Color2"))
                }
                .padding()
            }
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct ContentView: View {
    @State private var showDialog = false
    
    var body: some View {
        VStack {
            Button(action: {
                showDialog = true
            }) {
                Text("Show Dialog")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            if showDialog {
                CustomDialog(message: "Do you accept the terms?", rejectAction: {
                    print("Reject button tapped")
                    showDialog = false
                }, acceptAction: {
                    print("Accept button tapped")
                    showDialog = false
                })
                .background(Color.black.opacity(0))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
