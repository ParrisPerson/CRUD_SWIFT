//
//  WebServiceConstants.swift
//  Lendu
//
//   
//

import Foundation

struct WebServiceConstants {
    
    struct Headers {
        static let headerName = "X-Auth-Token"
        static let cookieName = "Cookie"
        static let cookieValue = "Develop-Cookie-Bravo=PwBHytTKzI9kqpOYMIxuUFsuOYUMDj3xMswKCS64OHgDiD9YHK8u6P52L9n5VagKE4V3MvP87BRfq6GXYYUdB5388ZJ687Rw22tgIHOyufrkzWFSnO2mn8YTE36Sd1x6"
    }
    
    struct user {
        
        static let get = "https://hello-world.innocv.com/api/User"
        static let edit = "https://hello-world.innocv.com/api/User"
        
        static let delete = "https://hello-world.innocv.com/api/User"
        
        static let add = "https://hello-world.innocv.com/api/User"
    }
 
    enum ErrorTypes {
        case ErrorTypeGenericError
        case ErrorTypeUserUnauthorized
    }
    
    enum UserStates: Int {
        case userStateNotFound = 0
        case userStateActive = 1
        case userStateInactive = 2
        case userStateBlocked = 3
        case userStateError = -1
    }
}
