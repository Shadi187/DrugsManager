//import SwiftUI
//
////
////struct ListBackgroundModifier: ViewModifier {
////
////    @ViewBuilder
////    func body(content: Content) -> some View {
////        if #available(iOS 16.0, *) {
////            content
////                .scrollContentBackground(.hidden)
////        } else {
////            content
////        }
////    }
////}
//
//struct ContentView1: View {
//
//    @State var isEditing = false
//    @State var selection = Set<String>()
//
//    var names = ["Karl", "Hans", "Faustao"]
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.theme.main.ignoresSafeArea()
//                VStack {
//                    
//                    List(selection:$selection){
//                            ForEach(names,id:\.self){
//                                name in
//                                    Text(name)
//                                        .foregroundColor(.white)
//                                        .listRowBackground(
//                                            Color.theme.main
//                                        )
//                            }.onDelete(perform:changeIt())
//                        }
//                            
//                    //.onDelete(perform:)
//                    .modifier(ListBackgroundModifier())
//                            .scrollContentBackground(.hidden)
//                    .navigationBarTitle("Names")
//                    .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(Animation.spring())
////                    Button(action: {
////
////                    }) {
////                        Text(isEditing ? "Done" : "Edit")
////                            .frame(width: 80, height: 40)
////                    }
////                    .background(Color.yellow)
//                    CircleButton()
//                        .onTapGesture {
//                            self.isEditing.toggle()
//                        }
//                }
//                .padding(.bottom)
//            }
//        }
//    }
//    
//    func changeIt(){
//        
//    }
//}
//
//#if DEBUG
//struct ContentView1_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView1()
//    }
//}
//#endif
