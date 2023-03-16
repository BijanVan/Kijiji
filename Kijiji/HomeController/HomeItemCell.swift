//
//  HomeItemCellCollectionViewCell.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-06.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    static let reuseIdentifier = "home-cell-reuse-identifier"

    let imageView = UIView()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let favoriteImageView = UIImageView()

    // MARK: Overrides
    override init(frame: CGRect) {
        super.init(frame: .zero)
        prepareSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: functions
    func configure(item: HomeItem) {
        styleSubviews(item: item)
    }

    // MARK: Private functions
    private func prepareSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(favoriteImageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: widthAnchor),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5),
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 0.5),
        ])

        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5),
            priceLabel.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 0.5),
        ])

        NSLayoutConstraint.activate([
            favoriteImageView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 0.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: favoriteImageView.trailingAnchor, multiplier: 0.5),
        ])
    }

    private func styleSubviews(item: HomeItem) {
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.appColor.cgColor

        descriptionLabel.text = item.description
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)

        priceLabel.text = item.price
        priceLabel.font = UIFont.preferredFont(forTextStyle: .body)

        favoriteImageView.image = UIImage(systemName: "heart")
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct HomeItemCell_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                let cell = HomeItemCell()
                cell.configure(item: HomeItem(description: "Description", price: "$500"))
                return cell
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
