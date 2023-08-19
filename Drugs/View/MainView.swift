//
//  MainView.swift
//  Drugs
//
//  Created by boshFbt on 09/08/2023.
//

import SwiftUI


struct ListBackgroundModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

struct MainView: View {
    @ObservedObject var vm :MainViewModel
//    @StateObject var mm = AddDrugVM()
    @State private var isEditing:Bool = false
    @State private var editM:EditMode = .inactive
    @State var selection = Set<String>()
    @State var nameHasEntered: Bool = false
    var data = ["s","s","d","d"]
    var body: some View {
        ZStack{
            //Background Layer
            Color.theme.second.ignoresSafeArea()
                .sheet(isPresented: $vm.showAddDrug) {
                    AddDrug()
                }
            
            
//            if !vm.userEnteredName {
//                addView
//
//            }else {}
                
            
            //Content Layer
            VStack{
                //The Navbar
                navbar
                
//                Show the drugs
                if vm.arrayOfDrugs.isEmpty {
                    
                }else {
                    drugList
                }
                
                Spacer()
            }
            
            
            
        
    }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MainView(vm: MainViewModel())
        }.environmentObject(dev.mainVM)
    }
}


extension MainView {
    var navbar: some View {
        HStack{
            CircleButton(logo:"pencil")
                .onTapGesture {
                    self.isEditing.toggle()
                }
//            Button(action:changeIt ) {
//                Text("edit")
//            }
            
//                }
            Spacer()
            VStack {
                
                Text("Welcome Back ")
                    
//                Text("Dr. \(vm.hasEnteredName ? vm.userName! : "" )")
            }.foregroundColor(.gray)
            Spacer()
            CircleButton(logo:"plus")
                .onTapGesture {
                    withAnimation {
                        vm.showAddDrug.toggle()
                    }
                }
//            EditButton()
        }.padding()
            
    }
    
    var drugList:some View{
        List(selection:$selection){
            ForEach(vm.arrayOfDrugs){ data in
                
                    
                        NavigationLink{
//                            EachDrugView(genName: data.generic_name ?? "", tradeName: data.trade_name ?? "" , dose: data.dose ?? "", description: data.drugDescription ?? "", url: data.url ?? "" )
                            EachDrugView(drug: data)
                        }label:{
                            RowDrugView(genName: data.generic_name ?? "" , trName: data.trade_name ?? "",tURL: data.url ?? "")
                        }
                        
                    
                
                    .listRowBackground(
                        Color.theme.second.ignoresSafeArea()
                    )
                    
            }.onDelete(perform:vm.deleteDrug)
                .onMove(perform: vm.moveDrug)
        }
        .listStyle(.plain)
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(Animation.spring())
        
        
        .modifier(ListBackgroundModifier())
        .scrollContentBackground(.hidden)
    }
    
//    var addView: some View {
//
//            VStack{
//                TextField("dasdsada", text: $vm.tempName)
//
//                Text("Save")
//                    .bold()
//                    .onTapGesture {
//                        UserDefaults.standard.set(vm.tempName, forKey: "username")
//                        vm.hasEnteredName = true
//                        UserDefaults.standard.set(vm.hasEnteredName, forKey: "check")
//
//                    }
//
//            }
//
//        }
    func changeIt(){
        self.isEditing.toggle()
    }
    
}

//extension UITableViewCell {
//
//    var reorderControlImageView: UIImageView? {
//        let reorderControl = self.subviews.first { view -> Bool in
//            view.classForCoder.description() == "UITableViewCellReorderControl"
//        }
//        return reorderControl?.subviews.first { view -> Bool in
//            view is UIImageView
//        } as? UIImageView
//    }
//}
//
extension UIImageView {

    func tint(color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UITableViewCell {

    var reorderControlImageView: UIImageView? {
        let reorderControl = self.subviews.first { view -> Bool in
            view.classForCoder.description() == "UITableViewCellReorderControl"
        }
        return reorderControl?.subviews.first { view -> Bool in
            view is UIImageView
        } as? UIImageView
    }

    
}
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.reorderControlImageView?.tint(color: UIColor(Color.white))
}

//
//extension UITableViewController{
//    private var myReorderImage : UIImage? = nil;
//
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        for subViewA in cell.subviews {
//            if (subViewA.classForCoder.description() == "UITableViewCellReorderControl") {
//                for subViewB in subViewA.subviews {
//                    if (subViewB.isKind(of: UIImageView.classForCoder())) {
//                        let imageView = subViewB as! UIImageView;
//                        if (myReorderImage == nil) {
//                            let myImage = imageView.image;
//                            myReorderImage = myImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate);
//                        }
//                        imageView.image = myReorderImage;
//                        imageView.tintColor = UIColor.red;
//                        break;
//                    }
//                }
//                break;
//            }
//        }
//    }
//}
