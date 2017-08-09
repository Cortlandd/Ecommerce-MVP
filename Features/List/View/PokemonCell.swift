//
//  PokemonCell.swift
//  Ecommerce-MVP
//
//  Created by Lucas M Soares on 06/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    var item: CategoryProtocol? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customLayout()
    }
}

// MARK: - Private methods

extension PokemonCell {

    fileprivate func customLayout() {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let cellHeight = 250
        let cellWidth = Int(UIScreen.main.bounds.size.width)
        
        layout?.scrollDirection = .horizontal
        layout?.itemSize = CGSize(width: cellWidth, height: cellHeight - 1)
    }
}

// MARK: - Collection view data source

extension PokemonCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let item = item else { return 0 }
        return item.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = item else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
        cell.item = item.pokemons[indexPath.row]
        return cell
    }
}

// MARK: - Collection view delegate

extension PokemonCell: UICollectionViewDelegate { }
