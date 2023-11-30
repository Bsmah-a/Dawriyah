//
//  d.swift
//  Dawriyah
//
//  Created by Renad Alqarni on 27/11/2023.
//
import SwiftUI

struct DawriyahTurns: View {
    @State private var items = ["Raseel", "Jude", "Haifa", "Renad"]
    @State private var memoji = ["memoji1", "memoji2", "memoji3", "memoji1"]

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
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 10)

                                Text(items[index].capitalized)
                            }
                        }
                        .onMove { indices, newOffset in
                            items.move(fromOffsets: indices, toOffset: newOffset)
                            memoji.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    }
                }
                .navigationTitle("Dawriyah Turns")
                .navigationBarItems(leading: EditButton())
            }
            .accentColor(Color("Color2"))
        }
    }
}

#Preview {
    DawriyahTurns()
}
