//
//  DetailsInteractor.swift


import Foundation

class DetailsInterector {
    func loadDetail(tail:String, callback: @escaping (Amiibo?) -> Void ) {
        let list:[Amiibo] =   load("amiibo.json")
        list.forEach{ amiibo in
            if amiibo.tail == tail {
                callback(amiibo)
                return
            }
        }
        
        callback(nil)
    }
}
