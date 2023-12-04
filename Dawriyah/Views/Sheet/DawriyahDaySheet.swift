//
//  DawriyahDaySheet.swift
//  Dawriyah
//
//  Created by Renad Alqarni on 30/11/2023.
//

import SwiftUI 
struct DawriyahDaySheet: View {
                         
@State var addressD:String = ""
@State var dawriyahDay = Date()
@State var startD = Date()
@State var endD = Date()
@State var notes:String = ""
                         
var body: some View {
NavigationView{
      VStack{
          Text("Select Dawriyah Day").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
RoundedRectangle(cornerRadius: 25.0).frame(width: 350,height: 3).foregroundColor(.gray).opacity(0.20)
                               
    // address of dawriyah ...................................
Text("address").font(.title2).bold().foregroundColor(Color("Color2")).padding(.trailing, 250.0)
                               
TextField("", text: $addressD).padding().frame(width: 302,height: 58).background(Color("TextField")).cornerRadius(15).foregroundColor(Color("TitleC")).bold().padding(.bottom, 30.0)
      Divider()
                               
   //Day of Dawriyah ....................
                               
HStack(spacing:20){
    Text("Choose day").font(.title2).foregroundColor(Color("Color2")).padding(.leading, -70.0)
   DatePicker("", selection: $dawriyahDay, displayedComponents: [.date]).frame(width: 115.0).background(Color("SplashColor")).cornerRadius(15)}
          Divider()
                               
  //Start time of Dawriyah ....................
HStack{
Text("Start Time").font(.title2).foregroundColor(Color("Color2")).padding(.leading, -120.0)
     DatePicker("", selection: $startD, displayedComponents: .hourAndMinute) .labelsHidden().background(Color("SplashColor")).cornerRadius(15)}
                               
   //End time of Dawriyah ....................
 HStack{
   Text("End Time").font(.title2).foregroundColor(Color("Color2")).padding(.leading, -120.0)
        DatePicker("", selection: $endD, displayedComponents:.hourAndMinute).labelsHidden().background(Color("SplashColor")).cornerRadius(15)}
                               Divider()
    // notes.............
Text("notes :").font(.title2).bold().foregroundColor(Color("Color2")).padding(.trailing, 250.0)
TextField("", text: $notes).padding().frame(width: 302,height: 150).background(Color("TextField")).cornerRadius(15).foregroundColor(Color("TitleC")).bold().padding(.bottom, 30.0)
     Divider()
        
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
      Text("Add Dawriyah").padding().frame(width: 229, height: 53).background(Color("Color2")).foregroundColor(.white).cornerRadius(20).bold().font(.headline)
   })
       }
 }
}
}
#Preview {
    DawriyahDaySheet()
}
