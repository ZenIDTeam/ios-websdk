
import Foundation


protocol CredentialsService {
    
    var url: String { get set }
    var username: String { get set }
    var password: String { get set }
    
}


final class PlistCredentialsService: CredentialsService {
    
    static var shared = PlistCredentialsService()
    
    var url: String = ""
    
    var username: String = ""
    
    var password: String = ""
    
}
