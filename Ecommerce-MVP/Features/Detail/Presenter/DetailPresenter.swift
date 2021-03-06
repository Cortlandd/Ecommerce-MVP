//
//  DetailPresenter.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

final class DetailPresenter {

    fileprivate unowned let view: DetailViewProtocol
    fileprivate let router: DetailRouterProtocol
    
    // Storage properties
    fileprivate var viewItem: DetailModel?
    let item: Pokemon
    let price: String
    
    init(view: DetailViewProtocol, router: DetailRouterProtocol, item: DetailedPokemon) {
        self.router = router
        self.view = view
        self.item = item.pokemon
        self.price = item.price
        
        self.setStorageViewItem()
    }
}

// MARK: - Public methods

extension DetailPresenter {

    func fillViewOutlets() {
        
        guard let viewItem = viewItem else {
            fatalError("View item cannot be nil")
        }
        
        view.fillViewOutlets(item: viewItem)
    }
    
    func buyItem() {
        router.presentStore(with: DetailedPokemon(pokemon: item, price: price))
    }
}

// MARK: - Private methods

extension DetailPresenter {
    
    fileprivate func setStorageViewItem() {
        
        viewItem = DetailModel(name: item.name, image: item.image, background: getBrackground(from: item), types: getTypes(from: item), weakness: getWeakness(from: item), description: item.description, price: price)
    }
    
    private func getBrackground(from: Pokemon) -> UIImage {
        
        var background = UIImage()
        
        if from.types.contains(where: { $0 == .fire }) {
            background = #imageLiteral(resourceName: "fire-background")
        }
        else if from.types.contains(where: { $0 == .flying }) {
            background = #imageLiteral(resourceName: "sky-background")
        }
        else if from.types.contains(where: { $0 == .water }) {
            background = #imageLiteral(resourceName: "water-background")
        }
        else { background = #imageLiteral(resourceName: "default-background") }
        
        return background
    }
    
    private func getTypes(from: Pokemon) -> [UIImage] {
        
        var types = [UIImage]()
        
        for type in from.types {
            types.append(type.image)
        }
        
        return types
    }
    
    private func getWeakness(from: Pokemon) -> [UIImage] {
        
        var weakness = [UIImage]()
        
        for weak in from.weakness {
            weakness.append(weak.image)
        }
        
        return weakness
    }
}
