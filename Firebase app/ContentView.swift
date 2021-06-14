//
//  ContentView.swift
//  Firebase app
//
//  Created by Aaron Xue on 2021/5/26.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct ContentView: View {
    @State var isProfileShow = false
    @State var counter: CGFloat = 0;
    @ObservedObject private var viemModel = ViewModel()
    @ObservedObject var control = CardView_Control()
        
    var body: some View {
        ScrollView {
            TopMenu(isProfileShow: $isProfileShow)
                .padding()
                .padding(.bottom, -10)
            
            ForEach(self.viemModel.cardData) { card in
                CardView (
                    subtitle: card.subtitle,
                    title: card.title,
                    backgroundImage: Image(card.backgroundImage),
                    briefSummary: card.briefSummary,
                    description: card.description
                )
                .environmentObject(self.control)
            }
        }
        .onAppear { self.viemModel.readData() }
        .background(Color("bgColor1"))
        .sheet(isPresented: $isProfileShow, content: {
            ProfileView(isProfileShow: self.$isProfileShow)
        })
        //.edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.light)
            
            ContentView().colorScheme(.dark)
        }
    }
}
#endif


struct TopMenu: View {
    @Binding var isProfileShow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Date(), style: .date)
                .font(.caption)
                .padding(.bottom, -10)
                .foregroundColor(.gray)
            
            HStack(alignment: .center) {
                Text("Today")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: { self.isProfileShow.toggle() }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                Button(action: { self.isProfileShow.toggle() }) {
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}


//struct ContentView: View {
//    @ObservedObject private var viemModel = ViewModel()
//
//    @State private var name = ""
//    @State private var strFinished = ""
//    @State private var isFinished = false
//    @State private var date = Date()
//
//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
//        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
//        return calendar.date(from:startComponents)!
//            ...
//            calendar.date(from:endComponents)!
//    }()
//
//    var body: some View {
//        VStack{
//            Text("ToDO App")
//                .padding().font(.title)
//            Text("輸入數據")
//                .padding().font(.system(size: 12, weight: .light, design: .serif))
//
//            HStack{
//                Text("名稱")
//                    .padding().font(.system(size: 12, weight: .light, design: .serif))
//                TextField("請輸入名稱", text: $name).font(.system(size: 12, weight: .light, design: .serif))
//            }
//            HStack{
//                Text("是否完成")
//                    .padding().font(.system(size: 12, weight: .light, design: .serif))
//                TextField("請輸入是或否", text: $strFinished).font(.system(size: 12, weight: .light, design: .serif))
//            }
//            HStack{
//                Text("到期時間")
//                    .padding().font(.system(size: 12, weight: .light, design: .serif))
//                DatePicker(
//                        "",
//                         selection: $date,
//                         in: dateRange,
//                         displayedComponents: [.date, .hourAndMinute]
//                )
//            }.padding()
//            Button(action: {
//                viemModel.writeData(name: name, strFinish: strFinished, date: date)
//            }) {
//                Text("新增數據").font(.system(size: 12, weight: .light, design: .serif))
//            }
//            HStack {
//                LabelledDivider(label: "Load")
//            }
//            Button(action: {
//                viemModel.readData()
//            }) {
//                Text("讀取數據").font(.system(size: 12, weight: .light, design: .serif))
//            }
//            List($viemModel.cards){card in
//                HStack{
//                    Text("Name").font(.system(size: 12, weight: .light, design: .serif))
//                    Text("\(card.name)").font(.system(size: 12, weight: .light, design: .serif))
//                }
//            }.onAppear { self.viemModel.readData() }
//            Spacer()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
