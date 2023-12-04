//
//  CalanderView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 08/05/1445 AH.
//

import SwiftUI

struct CalendarView: View {
    @Environment(\.presentationMode) var presentationMode
    let calendar = Calendar.current
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State private var selectedDate: Date = Date()
    @State private var showData = false
    @State private var showSheet = false
    @State private var isSheetPresented = false
    @State private var DawriyahSheet = false
    let people:[ peopleInfo] = [
        peopleInfo(emoji: 1, name: "Renad"),
        peopleInfo(emoji: 2, name: "Basemah"),
        peopleInfo(emoji: 3, name: "Reema"),
        peopleInfo(emoji: 1, name: "Taif")]
    @State private var busyMembers: [peopleInfo] = []
    @State private var busyDays: Set<Date> = []

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 350, height: 1)
                    .padding(.vertical, -60)

                Text("Dawriyah turns")
                    .font(.title2)
                    .padding(.vertical, -60)
                    .offset(x: -100)

                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Color3"))
                        .frame(width: 340, height: 60)
                        .cornerRadius(15)
                        .offset(x: 5, y: -40)
                        .padding()

                    HStack(spacing: 10) {
                        ForEach(people) { person in
                            Image("memoji\(person.emoji)")
                               
                                .offset(x: -10, y: -40)
                        }
                    }

                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "ellipsis").foregroundColor(Color("TitleC"))
                    }
                    .offset(x: 150, y: -40)
                    .sheet(isPresented: $showSheet, content: {
                        DawriyahTurns()
                    })
                }

                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 350, height: 1)
                    .padding(.vertical, -45)

                Text("Highlight your busy days !")
                    .font(.title2)
                    .padding(.vertical, -50)
                    .offset(x: -50)
                //calendar
                VStack() {
                    Divider().frame(height: 1)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .padding(.horizontal)
                        .datePickerStyle(.graphical)
                        .accentColor(Color.brown)
                        .onChange(of: selectedDate) { _ in
                            checkAvailability()
                        }
                    Divider()
                }
                .sheet(isPresented: $isSheetPresented) {
                    BusyMembers(busyMembers: $busyMembers)
                }
            }
            .navigationTitle("Family")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left").foregroundColor(Color("Color2"))
                        Text("Back").foregroundColor(Color("Color2"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        DawriyahSheet.toggle()
                    }) {
                        Image(systemName: "pin.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color("Color2"))
                    }
                }
            }
            .sheet(isPresented: $DawriyahSheet) {
                DawriyahDaySheet()
            }
        }
    }

    func checkAvailability() {
        let isDateAvailable = true

        if isDateAvailable {
            isSheetPresented = true
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
