//
//  CreateView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 08/05/1445 AH.
//

import SwiftUI
import CloudKit

struct CreateView: View {
    
    @State var dawriyahName: String = ""
    @State var startDate = Date()
   
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                    Color("backg").ignoresSafeArea()
                VStack(spacing: 20){
                    HStack(spacing:30){
                        RoundedRectangle(cornerRadius: 25).fill(Color("Color2")).frame(width: 150, height: 4)
                        
                        RoundedRectangle(cornerRadius: 25).fill(Color("Color2")).frame(width: 150, height: 4).opacity(0.37).padding()
                    }
                    
                    .padding(.bottom, 30.0)
                    
                    VStack(spacing:10){ Text("Dawriyah Name").fontWeight(.regular).padding(.leading, -170.0).font(.title2)
                        TextField("", text: $dawriyahName).padding().frame(width:340,height: 45).background(Color("TextField")).cornerRadius(18).foregroundColor(Color("TitleC")).bold()}.padding(.bottom, 10.0)
                    
                    Divider()
                .padding(.bottom, 20.0)
                   
                    HStack{
                        Text("Start Date:").fontWeight(.regular).padding(.leading, -94.0).font(.title2)
                        
        DatePicker("", selection: $startDate, displayedComponents: [.date])
                        .frame(width:302)
                        .cornerRadius(15)
                        .padding(.leading, -170.0)
                        .foregroundColor(Color("Color2"))}
                        .padding(.bottom, 42.0).font(.caption2)
                   
                   
                        .padding(.bottom, 240.0)
                    
                    NavigationLink(destination: peopleView()) {
                        Text("Add People").padding().frame(width: 229, height: 53).background(Color("Color2")).foregroundColor(.white).cornerRadius(20).bold().font(.headline)
                    }.padding(.top, 1.0)
                    Spacer()
                        
                }.padding()
                .navigationTitle("Create Dawriyah").foregroundColor(Color("TitleC"))
              
             .padding(.bottom,-50.0)
                
            }
        }.accentColor(Color("Color2"))
    }
    private func saveGroupsToCloudKit() {
       
        let record = CKRecord(recordType: "Groups")

        record.setValue(dawriyahName, forKey: "name")
       
        record.setValue(startDate, forKey: "startDate")
       
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
    CreateView()
}
