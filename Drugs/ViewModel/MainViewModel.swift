
import Foundation

class MainViewModel:ObservableObject{
    @Published var userName = UserDefaults.standard.string(forKey: "username")
    @Published var hasEnteredName:Bool = false
    @Published var userEnteredName = UserDefaults.standard.bool(forKey: "check")
    @Published var tempName:String = ""
}
