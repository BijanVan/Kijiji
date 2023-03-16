//
//  HomeViewController+DataSource.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-04.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.reuseIdentifier, for: indexPath) as! HomeItemCell
        let item = items?[indexPath.row] ?? HomeItem(description: "---", price: "---")
        cell.configure(item: item)
        return cell
    }
}
