//
//  DetailsRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI

class DetailsRouter{
    var presenter: DetailsPresenter?
    var view : DetailView?
    
    static func createModule(tail:String) -> DetailView {
        
        let router = DetailsRouter()
        let interector = DetailsInterector()
        let presenter = DetailsPresenter(router: router, interector: interector)

        let view = DetailView(presenter: presenter, tail: tail)
        router.presenter = presenter
        router.view = view
       
        return view
    }
}
