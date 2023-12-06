import SwiftUI
import CloudKit

struct DawriyahDaySheet: View {
    
    @State var addressD: String = ""
    @State var dawriyahDay = Date()
    @State var startD = Date()
    @State var endD = Date()
    @State var notes: String = ""

    var body: some View {
        NavigationView {
            VStack {
                
                Text("Select Dawriyah Day").bold().offset(y: -60)
                
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 350, height: 3)
                    .foregroundColor(.gray)
                    .opacity(0.20)
                    .offset(y: -50)
                

                Text("Address")
                    .fontWeight(.regular)
                 //   .foregroundColor(Color.brown)
                    .padding(.trailing, 250.0)
                    .offset(y: -30)

                TextField("", text: $addressD)
                    .padding()
                    .frame(width: 298, height: 36)
                    .background(Color("TextField"))
                    .cornerRadius(18)
                    .foregroundColor(Color("TitleC"))
                    .bold()
                    .offset(y: -30)
                  //  .padding(.bottom, 30.0)

                Divider()
                    .offset(y: -5)
                    .padding(.horizontal, 40)

                HStack(spacing: 20) {
                    Text("Choose day")
                        .fontWeight(.regular)
                    //    .foregroundColor(Color("Color2"))
                     //   .padding(.leading, -100.0)
                        .offset(y: 10)

                    DatePicker("", selection: $dawriyahDay, displayedComponents: [.date])
                        .frame(width: 200)
                     //   .background(Color("SplashColor"))
                        .cornerRadius(15)
                        .offset(y: 10)
                        .offset(x: -80)
                }
                
                Divider()
                    .offset(y: 22)
                    .padding(.horizontal, 40)
                

                HStack {
                    Text("Start Time")
                        .fontWeight(.regular)
                     //   .foregroundColor(Color("Color2"))
                        .padding(.leading, -120.0)
                        .offset(x: 12, y: 40)

                    DatePicker("", selection: $startD, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                      //  .background(Color("SplashColor"))
                        .cornerRadius(15)
                        .offset(x: 12, y: 40)
                    
                }

                HStack {
                    Text("End Time")
                        .fontWeight(.regular)
                    //    .foregroundColor(Color("Color2"))
                        .padding(.leading, -120.0)
                        .offset(x: 12, y: 55)

                    DatePicker("", selection: $endD, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                     //   .background(Color("SplashColor"))
                        .cornerRadius(15)
                        .offset(x: 12, y: 55)
                    
                }

                Divider()
                    .offset(y: 60)
                    .padding(.horizontal, 40)

                Text("Notes:")
                    .fontWeight(.regular)
                   // .bold()
                   // .foregroundColor(Color("Color2"))
                    .padding(.trailing, 250.0)
                    .offset(x: -5, y: 75)

                TextField("", text: $notes)
                    .frame(width: 302, height: 150)
                    .background(Color("TextField"))
                    .cornerRadius(15)
                    .foregroundColor(Color("TitleC"))
                    .bold()
                    .padding(.bottom, 30.0)
                    .offset(y: 80)

               
                Button(action: {
                    saveToCloudKit()
                }, label: {
                    Text("Add Dawriyah")
                        .padding()
                        .frame(width: 229, height: 53)
                        .background(Color("Color2"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .bold()
                        .font(.headline)
                        .offset(y: 80)
                })
            }
        }
    }

    private func saveToCloudKit() {
       
        let record = CKRecord(recordType: "Dawriyah")

        record.setValue(addressD, forKey: "address")
        record.setValue(dawriyahDay, forKey: "dawriyahDay")
        record.setValue(startD, forKey: "startTime")
        record.setValue(endD, forKey: "endTime")
        record.setValue(notes, forKey: "notes")

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

struct DawriyahDaySheet_Previews: PreviewProvider {
    static var previews: some View {
        DawriyahDaySheet()
    }
}
