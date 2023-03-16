//
//  SearchBarView.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-02.
//

import UIKit

class SearchBarView: UIView {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
        styleSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: textField.intrinsicContentSize.height + defaultSpacing * 2)
    }
    
    // MARK: Private functions
    private func prepareSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
        ])
    }
    
    private func styleSubviews() {
        backgroundColor = .systemBackground
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemFill.cgColor
        layer.cornerRadius = 5
        
        stackView.axis = .horizontal
        stackView.spacing = defaultSpacing
        
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        textField.placeholder = "Search for anything..."
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct SearchBarView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return SearchBarView()
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
