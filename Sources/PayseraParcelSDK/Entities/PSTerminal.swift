//
//  PSTerminal.swift
//  PayseraParcelSDK
//
//  Created by Gerald Adorza on 4/12/21.
//

import Foundation
import ObjectMapper

public class PSAccount: Mappable {
    
    public var number: String
    public var clientId: Int
    public var ownerId: Int
    public var createdAt: TimeInterval
    public var active: Bool
    public var closed: Bool
    public var type: String
    public var ibanList: [String]?
    
    required public init?(map: Map) {
        do {
            number = try map.value("number")
            clientId = try map.value("client_id")
            ownerId = try map.value("owner_id")
            createdAt = try map.value("created_at")
            active = try map.value("active")
            closed = try map.value("closed")
            type = try map.value("type")
            ibanList = try map.value("iban_list")
        } catch {
            print(error)
            return nil
        }
    }
    
    public func mapping(map: Map) {
        number          <- map["number"]
        clientId        <- map["client_id"]
        ownerId         <- map["owner_id"]
        createdAt       <- map["created_at"]
        active          <- map["active"]
        closed          <- map["closed"]
        type            <- map["type"]
        ibanList        <- map["iban_list"]
    }
}
