//
//  CategoryView.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-03.
//

import UIKit

class CategoryView: UIView {
    let stackView = UIStackView()
    let categories = [
        CategoryItemView(imageName: "dollarsign.circle", title: "Buy & Sell"),
        CategoryItemView(imageName: "car", title: "Autos"),
        CategoryItemView(imageName: "house", title: "Real Estate"),
        CategoryItemView(imageName: "briefcase", title: "Jobs"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    private func prepareSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        categories.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        categories.forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct CategoryView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return CategoryView()
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

