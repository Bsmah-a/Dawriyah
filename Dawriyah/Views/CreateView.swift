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
                    VStack(spacing:20){ Text("Dawriyah Name").bold().padding(.leading, -143.0).font(.title2)
                        TextField("", text: $dawriyahName).padding().frame(width: 302,height: 58).background(Color("TextField")).cornerRadius(15).foregroundColor(Color("TitleC")).bold()}.padding(.bottom, 30.0)
                    VStack{
                        Text("Start Date").bold().padding(.leading, -157.0).font(.title2)
                        DatePicker("", selection: $startDate, displayedComponents: .date).datePickerStyle(.wheel).frame(width:302 , height: 50).background(Color("TextField")).cornerRadius(15).foregroundColor(Color("Color2"))}.padding(.bottom, 42.0).font(.caption2)
                   
            
                    NavigationLink(destination: peopleView()) {
                        Text("Add People").padding().frame(width: 229, height: 53).background(Color("Color2")).foregroundColor(.white).cornerRadius(20).bold().font(.headline)
                    }.padding(.top, 30.0)
                    Spacer()
                        
                }.padding()
                .navigationTitle("Create Dawriyah").foregroundColor(Color("TitleC"))
                
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
