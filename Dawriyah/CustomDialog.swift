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
        NavigationStack{
            
            VStack {
                Text(message)
                    .font(.headline)
                    .padding()
                
                HStack {
                    Button(action: {
                        rejectAction()
                    }) {
                        Text("Reject")
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("SplashColor"))
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Button(action: {
                        acceptAction()
                    }) {
                        Text("Accept")
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.brown)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }}

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
                CustomDialog(message: "You Have an invetation ", rejectAction: {
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


//import SwiftUI
//
//struct InvitationView: View {
//    var body: some View {
//        VStack {
//            Text("You're invited!")
//                .font(.title)
//                .padding()
//            
//            Text("Join us for a special event.")
//                .padding(.bottom, 20)
//            
//            HStack(spacing: 20) {
//                Button(action: {
//                    // Action when "Accept" button is tapped
//                    print("Accepted")
//                }) {
//                    Text("Accept")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(Color.brown)
//                        .cornerRadius(8)
//                }
//                
//                Button(action: {
//                    // Action when "Reject" button is tapped
//                    print("Rejected")
//                }) {
//                    Text("Reject")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(Color.brown)
//                        .cornerRadius(8)
//                }
//            }
//            .padding(.top, 20)
//        }
//        .padding()
//    }
//}
//
//struct InvitationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InvitationView()
//    }
//}

