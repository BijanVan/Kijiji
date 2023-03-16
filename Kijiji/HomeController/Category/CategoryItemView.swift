//
//  CategoryItemView.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-02.
//

import UIKit

class CategoryItemView: UIView {
    let imageView = UIImageView()
    let label = UILabel()
    let dummy = UIView()
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        prepareSubviews()
        styleSubviews(imageName: imageName, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    private func prepareSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        dummy.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: defaultSize),
            imageView.heightAnchor.constraint(equalToConstant: defaultSize),
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 0.5),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func styleSubviews(imageName: String, title: String) {
        imageView.image = UIImage(systemName: imageName)
        
        label.font = UIFont.preferredFont(forTextStyle: .caption2).bold()
        label.text = title
        label.textColor = .appColor
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct CategoryItemView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return CategoryItemView(imageName: "dollarsign.circle", title: "Buy & Sell")
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
