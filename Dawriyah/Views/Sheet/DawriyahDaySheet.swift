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
                Text("Select Dawriyah Day").font(.title).bold()
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 350, height: 3)
                    .foregroundColor(.gray)
                    .opacity(0.20)

                Text("address")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("Color2"))
                    .padding(.trailing, 250.0)

                TextField("", text: $addressD)
                    .padding()
                    .frame(width: 302, height: 58)
                    .background(Color("TextField"))
                    .cornerRadius(15)
                    .foregroundColor(Color("TitleC"))
                    .bold()
                    .padding(.bottom, 30.0)

                Divider()

                HStack(spacing: 20) {
                    Text("Choose day")
                        .font(.title2)
                        .foregroundColor(Color("Color2"))
                        .padding(.leading, -70.0)

                    DatePicker("", selection: $dawriyahDay, displayedComponents: [.date])
                        .frame(width: 105.0)
                        .background(Color("SplashColor"))
                        .cornerRadius(15)
                }
                Divider()

                HStack {
                    Text("Start Time")
                        .font(.title2)
                        .foregroundColor(Color("Color2"))
                        .padding(.leading, -120.0)

                    DatePicker("", selection: $startD, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .background(Color("SplashColor"))
                        .cornerRadius(15)
                }

                HStack {
                    Text("End Time")
                        .font(.title2)
                        .foregroundColor(Color("Color2"))
                        .padding(.leading, -120.0)

                    DatePicker("", selection: $endD, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .background(Color("SplashColor"))
                        .cornerRadius(15)
                }

                Divider()

                Text("notes :")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("Color2"))
                    .padding(.trailing, 250.0)

                TextField("", text: $notes)
                    .frame(width: 302, height: 150)
                    .background(Color("TextField"))
                    .cornerRadius(15)
                    .foregroundColor(Color("TitleC"))
                    .bold()
                    .padding(.bottom, 30.0)

                Divider()

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
