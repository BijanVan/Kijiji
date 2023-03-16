//
//  HomeViewController+Delegate.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-04.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("row = \(indexPath.row)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        UIView.animate(withDuration: 0.3, delay: 0) { [weak self] in
            guard let self else { return }

            if offset > defaultSize {
                self.collectionViewTopAnchorNormal.isActive = false
                self.collectionViewTopAnchorSnap.isActive = true
            } else {
                self.collectionViewTopAnchorSnap.isActive = false
                self.collectionViewTopAnchorNormal.isActive = true
            }
            self.view.layoutIfNeeded()
        }
    }
}
