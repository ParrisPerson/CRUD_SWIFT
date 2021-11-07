//
// User.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class UserPost: JSONEncodable {

    public var name: String?
    public var birthdate: String?
    public var id: Int?

    public init() {
    
    }

    public enum CodingKeys: String, CodingKey {
        case name
        case birthdate
        case _id = "id"
    }
    
    func encodeToJSON() -> Any {
            var nillableDictionary = [String:Any?]()
            nillableDictionary["name"] = self.name
            nillableDictionary["birthdate"] = self.birthdate
            nillableDictionary["id"] = self.id
            let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
            return dictionary
        }


}
