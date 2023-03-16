//
//  HomeViewController.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-01.
//

import UIKit

class HomeViewController: UIViewController {
    var items: [HomeItem]?
    
    let searchBarView = SearchBarView()
    let categoryView = CategoryView()
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var collectionViewTopAnchorNormal: NSLayoutConstraint!
    var collectionViewTopAnchorSnap: NSLayoutConstraint!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
        prepareSubviews()
        styleSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchBarView)
        view.addSubview(categoryView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            searchBarView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            searchBarView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchBarView.trailingAnchor, multiplier: 1),
        ])
        
        NSLayoutConstraint.activate([
            categoryView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            categoryView.topAnchor.constraint(equalToSystemSpacingBelow: searchBarView.bottomAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: categoryView.trailingAnchor, multiplier: 1),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: collectionView.trailingAnchor, multiplier: 1),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionViewTopAnchorNormal = collectionView.topAnchor.constraint(equalToSystemSpacingBelow: categoryView.bottomAnchor, multiplier: 1)
        collectionViewTopAnchorSnap = collectionView.topAnchor.constraint(equalToSystemSpacingBelow: searchBarView.bottomAnchor, multiplier: 1)
        collectionViewTopAnchorNormal.isActive = true
    }
    
    private func styleSubviews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.reuseIdentifier)
    }

    private func fetchData() {
        let homeItem = HomeItem(description: "Mens golf clubs", price: "$500")
        items = Array(repeating: homeItem, count: 4)
    }
}

// MARK: - CollectionView
extension HomeViewController {
    static func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(defaultSize * 6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(defaultSpacing)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct HomeViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                HomeViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

