//
//  Purchase.swift
//  PokeCommerce
//
//  Created by Lucas M Soares on 16/12/16.
//  Copyright © 2016 DEVELMS. All rights reserved.
//

import UIKit

struct Purchase {
    
    var name: String
    var price: String
    var userName: String
    var cardNumber: String
    var date: String
    var image: UIImage?
    
    init(name: String, price: String, userName: String, cardNumber: String, date: String, image: UIImage? = nil) {
        
        self.name = name
        self.price = price
        self.userName = userName
        self.cardNumber = cardNumber
        self.date = date
        
        if let image = image { self.image = image }
    }
}
