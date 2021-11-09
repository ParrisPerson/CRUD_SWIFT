 

import Foundation
import Alamofire
 
class AddInteractor: NSObject, AddInteractorInputProtocol {
    
    weak var presenter: AddInteractorOutputProtocol?
    
    func touchAddButton(user: UserPost) {
 
        let parameters: [String: Any] = [
            "id" : user.id,
            "birthdate" : user.birthdate,
            "name" : user.name
        ]

        
        Alamofire.request("https://hello-world.innocv.com/api/User", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseData { response in
                print(response)
                self.presenter!.postSuccess()
            }
    }
    
    func touchEditButton(user: UserPost) {
 
        let parameters: [String: Any] = [
            "id" : user.id,
            "birthdate" : user.birthdate,
            "name" : user.name
        ]

        
        Alamofire.request("https://hello-world.innocv.com/api/User", method: .put, parameters: parameters, encoding: JSONEncoding.default)
            .responseData { response in
                print(response)
                self.presenter!.postSuccess()
            }
    }
}
