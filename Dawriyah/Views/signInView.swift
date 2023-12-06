//
//  signInView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 14/05/1445 AH.
//

import SwiftUI
import CloudKit
struct signInView: View {
    @State var username: String = ""
    var body: some View {
        NavigationStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0).foregroundColor(Color("SplashColor")).rotationEffect(Angle(degrees: 15)).offset(y: -350)
                    .frame(width: UIScreen.main.bounds.width * 3, height: 250)
                VStack(spacing: 20){
                    Image("DAWRIYAH").padding()
                    
                    TextField("Insert your name", text: $username).padding().frame(width: 320,height: 58).background(Color("TextField")).cornerRadius(20).foregroundColor(Color("TitleC")).bold()
                    
                    NavigationLink(destination: CreateView()){
                        Text("Sign in").frame(width:170, height: 58).background(Color("Color2")).cornerRadius(20).foregroundColor(.white).bold()
                    }
                    
                }
            }
        }.accentColor(Color("Color2"))
        
    }
    private func saveToCloudKit() {
       
        let record = CKRecord(recordType: "Users")

        record.setValue(username, forKey: "name")
        

        let privateDatabase = CKContainer(identifier: "iCloud.Dawriyah").publicCloudDatabase

        privateDatabase.save(record) { (savedRecord, error) in
            if error == nil {
                print("Record saved")
            } else {
                print("Record not saved.. \(error?.localizedDescription ?? "")")
            }
        }
    }
    }


#Preview {
    signInView()
}
