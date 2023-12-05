//
//  d.swift
//  Dawriyah
//
//  Created by Renad Alqarni on 27/11/2023.
//
import SwiftUI
import CloudKit

struct DawriyahTurns: View {
    @State private var items: [String] = []
    @State private var memoji: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Drag and drop to arrange order")
                    .font(.title2)
                    .padding(.vertical, 10)
                    .offset(x: -33)

                List {
                    Section(header: Text("edit order")) {
                        ForEach(items.indices, id: \.self) { index in
                            HStack {
                                Image(memoji[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 5)

                                Text(items[index].capitalized).font(.system(size: 20))
                            }
                        }
                    }
                }
                .onAppear {
                    fetchDataFromCloudKit()
                }
                .navigationTitle("Dawriyah Turns")
                .navigationBarItems(leading: EditButton())
            }
            .accentColor(Color("Color2"))
        }
    }

    func fetchDataFromCloudKit() {
        let container = CKContainer.default()
        let publicDatabase = CKContainer(identifier: "iCloud.Dawriyah").publicCloudDatabase


        let query = CKQuery(recordType: "Users", predicate: NSPredicate(value: true))

        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error fetching records: \(error.localizedDescription)")
            } else if let records = records {
                DispatchQueue.main.async {
                    self.items = records.compactMap { $0["name"] as? String }
                    self.memoji = records.compactMap { $0["image"] as? String }
                }
            }
        }
    }

}

struct DawriyahTurns_Previews: PreviewProvider {
    static var previews: some View {
        DawriyahTurns()
    }
}
