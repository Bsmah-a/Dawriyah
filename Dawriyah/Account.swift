//
//  Account.swift
//  Dawriyah
//
//  Created by Reema Alsmari on 29/11/2023.
//

import SwiftUI

struct Account: View {
    
    @State private var isShowingProfileSheet = false

    var body: some View {
        VStack {
            // Profile Picture Button
            Button(action:   {
                isShowingProfileSheet.toggle()
                
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .foregroundColor(.brown)
            }
            .sheet(isPresented: $isShowingProfileSheet) {
                ProfileSheet()
            }
        }
        .padding()
    }
}

struct ProfileSheet: View {
    @State private var isShowingAccountSettings = false
    @State private var isShowingInvitations = false

    var body: some View {
        NavigationView {
            List {
                // Account Settings Button
                Button(action: {
                    isShowingAccountSettings.toggle()
                    
                }) {
                    Text("Account Settings")
                    .foregroundColor(.brown)
                }
                .sheet(isPresented: $isShowingAccountSettings) {
                    AccountSettingsView()
                }

                // Invitations Button
                Button(action: {
                    isShowingInvitations.toggle()
                }) {
                    Text("Invitations")
                    .foregroundColor(.brown)
                    
                }
                .sheet(isPresented: $isShowingInvitations) {
                    InvitationsView()
                }
            }
            .navigationTitle("Profile")
//            .navigationBarItems(trailing: Button("Done") {
//                // Action when "Done" button is tapped
//                // You can perform any necessary actions here
//                // For example, dismissing the sheet
//                dismiss()
//            })
        }
    }

//    private func dismiss() {
//        // Function to dismiss the sheet
//        // You can customize it based on your needs
//        // Here, we simply set the isShowingProfileSheet to false
//        // to dismiss the sheet
//       // isShowingProfileSheet = false
//    }
}

struct AccountSettingsView: View {
    var body: some View {
        Text("Account Settings")
            .padding()
    }
}

struct InvitationsView: View {
    var body: some View {
        Text("Invitations")
            .padding()
    }
}

#Preview {
    Account()
}
