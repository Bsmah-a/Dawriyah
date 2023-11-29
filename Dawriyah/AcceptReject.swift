//
//  AcceptReject.swift
//  Dawriyah
//
//  Created by Shahad Alzowaid on 15/05/1445 AH.
//

import SwiftUI

struct AcceptReject: View {

        @State private var isShowingDialog = false // State variable to control the visibility of the dialog
        
        var body: some View {
            NavigationView {
                ZStack {
                    Color("backg").ignoresSafeArea()
                    
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 60)
                        .padding(.bottom, 720)
                        .padding(.leading, 275)
                        .navigationTitle("Dwriyah Groups")
                        .foregroundColor(Color("Color2"))
                        .bold()
                    
                    VStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 350, height: 1)
                            .padding(.vertical, -290)
                        
                        Button(action: {
                            isShowingDialog = true // Show the dialog when the button is tapped
                        }) {
                            Text("Open Dialog")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .overlay(
                    Group {
                        if isShowingDialog {
                            // Pop-up dialog
                            DialogView(isShowingDialog: $isShowingDialog)
                        }
                    }
                )
            }
        }
    }

    struct DialogView: View {
        @Binding var isShowingDialog: Bool // Binding to control the visibility of the dialog
        
        var body: some View {
            VStack {
                Text("You've been invited to ... ")
                    .font(.title2)
                    .padding()
                
                HStack {
                    Button(action: {
                        // Handle reject action
                        isShowingDialog = false // Close the dialog
                    }) {
                        Text("Reject")
                            .padding()
                            .frame(width:120, height: 58).background(Color("SplashColor"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding()
                    Button(action: {
                        // Handle accept action
                        isShowingDialog = false // Close the dialog
                    }) {
                        Text("Accept")
                            .padding()
                            .frame(width:120, height: 58).background(Color("Color2"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
    }

    struct AcceptReject_Previews: PreviewProvider {
        static var previews: some View {
            AcceptReject()
        }
    }

    /*var body: some View {
        
        NavigationStack{
            ZStack{
                Color("backg").ignoresSafeArea()
                
                Image("profile").resizable().scaledToFill().frame(width: 10, height: 60).padding(.bottom,720).padding(.leading, 275)
                
                    .navigationTitle("Dwriyah Groups").foregroundColor(Color("Color2")).bold()
                
                VStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width:350,height: 1)
                        .padding(.vertical,-315)
                }
            }
        }
    }}*/

#Preview {
    AcceptReject()
}

