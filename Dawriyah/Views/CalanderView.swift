//
//  CalanderView.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 08/05/1445 AH.
//
import SwiftUI

struct CalendarView: View {
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
            // groups
            VStack {
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width:350,height: 1)
                    .padding(.vertical,-40)
                
                Text("Dawriyah turns")
                    .font(.title2)
                    .padding(.vertical,-40)
                    .offset(x:-100)
                
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(Color("Color3"))
                        .frame(width: 340, height: 60)
                        .cornerRadius(15)
                        .offset(x: 5, y: -20)
                        .padding()
                    
                    
                    
                    HStack(spacing: 10){
                        ForEach(people) { person in
                            Image("memoji\(person.emoji)")
                                .offset(x:-10,y:-20)
                        }
                        
                    }
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "ellipsis").foregroundColor(Color("TitleC"))
                    }
                    .offset(x: 150, y: -20)
                    .sheet(isPresented: $showSheet, content: {
                        DawriyahTurns()
                    })
                }
                
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width:350,height: 1)
                    .padding(.vertical,-15)
                
                Text("Highlight your busy days !")
                    .font(.title2)
                    .padding(.vertical,-10)
                    .offset(x:-50)
                
            }.navigationTitle("Family").toolbar {
                Button(action:{
                    DawriyahSheet.toggle()
                }) {
                    Image(systemName: "pin.circle")
                        .font(.largeTitle)
                        .foregroundColor(Color("Color2"))
//                        .padding(.vertical,-50)
                }}
            .sheet(isPresented: $DawriyahSheet, content: {
                DawriyahDaySheet()})
            
        }.accentColor(Color("Color2"))
    }
 
}
//calendar
struct CalendarPage: View {
    @State private var selectedDate: Date?
    @State private var busyDays: [Date] = [] // Array to store busy days
    @State private var currentDate: Date = Date()
    @State private var isSheetPresented: Bool = false
    @State private var selectedDay: Date?
    @State private var busyMembers: [peopleInfo] = []

    // Pass the 'people' array to CalendarPage
    let people: [peopleInfo] = [
        peopleInfo(emoji: 1, name: "Renad")
      ]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                CalendarView()
                HStack {
                    Button("<") {
                        currentDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) ?? currentDate
                    }.font(.title).padding(.leading)
                    Spacer()
                    Text("\(currentDate, formatter: DateFormatter.monthYear)")
                        .font(.title2)
                    Spacer()
                    Button(">") {
                        currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) ?? currentDate
                    }.font(.title).padding(.trailing)
                }
                .padding()

                // Pass 'people' to Calendar1View
                Calendar1View(selectedDate: $selectedDate, busyDays: $busyDays, currentDate: $currentDate, people: people) { day in
                    isSheetPresented = true
                    selectedDay = day
                }
                .padding()
                .sheet(isPresented: $isSheetPresented) {
                    BusyDaySheet(
                        isBusy: busyDays.contains(selectedDay ?? Date()),
                        onMarkBusy: {
                            if let selectedDay = selectedDay {
                                if busyDays.contains(selectedDay) {
                                    busyDays.removeAll { $0 == selectedDay }
                                } else {
                                    busyDays.append(selectedDay)
                                }
                            }
                            isSheetPresented = false
                        },
                        people: people
                    )
                }

                Spacer()
            }
            .accentColor(Color("Color2"))
        }
    }
}
                
struct Calendar1View: View {
    @Binding var selectedDate: Date?
    @Binding var busyDays: [Date]
    @Binding var currentDate: Date
    var people: [peopleInfo] // Add people parameter
    var onDayTapped: (Date) -> Void

    var body: some View {
        VStack {
            // Days of the week
            HStack(spacing: 27) {
                ForEach(DateFormatter().shortWeekdaySymbols, id: \.self) { day in
                    Text(day)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            // Calendar days
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(monthDays(), id: \.self) { day in
                    DayView(date: day, isSelected: selectedDate == day, isBusy: busyDays.contains(day))
                        .onTapGesture {
                            selectedDate = day
                            onDayTapped(day)
                        }
                }
            }
        }
    }
    // Helper function to get the days of the month
    private func monthDays() -> [Date] {
        let calendar = Calendar.current
        let monthRange = calendar.range(of: .day, in: .month, for: currentDate)!
        let days = monthRange.map { calendar.date(bySetting: .day, value: $0, of: currentDate)! }
        return days
    }
}
                
                struct DayView: View {
                    let date: Date
                    let isSelected: Bool
                    let isBusy: Bool
                    
                    var body: some View {
                        VStack {
                            Text("\(date.day)")
                                .foregroundColor(isBusy ? .gray : (isSelected ? .white : .primary))
                                .padding(8)
                                .background(isSelected ? Color.brown : Color.clear)
                                .clipShape(Circle())
                            
                            // Circle underneath for busy days
                            Circle()
                                .fill(isBusy ? Color.gray : Color.clear)
                                .frame(width: 6, height: 6)
                                .padding(.top, -4)
                                .opacity(isBusy ? 1.0 : 0.0)
                        }
                    }
                }
struct BusyDaySheet: View {
    var isBusy: Bool
    var onMarkBusy: () -> Void
    var people: [peopleInfo]

    @State private var showUserInfo: Bool = false // Add a state variable

    var body: some View {
        NavigationView {
            VStack {
                Text("BusyMembers")
                    .font(.title).bold()
                    .padding(.leading, 10)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width:335,height: 1)
                    .padding(.vertical,-20)

                Spacer()

                if isBusy || showUserInfo {
                    ForEach(people) { person in
                        HStack {
                            Image("memoji\(person.emoji)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text(person.name)
                                .font(.title3)
                        }
                    }
                }

                Spacer()

               
            } .toolbar {Button(action: {
                onMarkBusy()
                showUserInfo.toggle() // Toggle the state to show/hide user info
            }) {
                Text(isBusy ? Image(systemName: "plus.app.fill") : Image(systemName: "plus.app"))
                    .padding(.top,90)
                    .padding(.trailing,20)
                    .foregroundColor(Color("Color2"))
                    .cornerRadius(8)
            }}
//            .padding()
        }
    }
}
 extension Date {
     var day: Int {
         let calendar = Calendar.current
         return calendar.component(.day, from: self)
     }
 }

 extension DateFormatter {
     static var monthYear: DateFormatter {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMMM yyyy"
         return formatter
     }
 }

 struct CustomBackButton: View {
     var body: some View {
         NavigationLink(destination: EmptyView()) {
             HStack {
                 Image(systemName: "chevron.left")
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 32, height: 32)
                 Text("Back")
             }
             .foregroundColor(.blue)
             .padding(.vertical, 8)
             .padding(.horizontal, 16)
             .background(Color.clear)
         }
     }
 }



 struct CalendarPage_Previews: PreviewProvider {
     static var previews: some View {
         CalendarPage()
     }
 }
