//
//  DetailsPresenter.swift
//  vipertest
//
//  Created by Jonn Alves on 11/02/23.
//

import Foundation
import Combine


class DetailsPresenter : ObservableObject{
    
    @Published var amiibo : Amiibo? = nil
    @Published var error: Bool = false
    
    let router: DetailsRouter
    var interector: DetailsInterector
    
    init(router: DetailsRouter, interector:DetailsInterector){
        self.router = router
        self.interector = interector
    }
    
    func getDetails(tail:String){
        interector.loadDetail(tail: tail, callback: { amiibo in
            if amiibo == nil {
                self.error = true
            } else {
                self.amiibo = amiibo!
            }
        })
    }
   
}
