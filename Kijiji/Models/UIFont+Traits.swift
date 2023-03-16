//
//  UIFont+Traits.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-02.
//

import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        UIFont(descriptor: fontDescriptor.withSymbolicTraits(traits)!, size: 0)
    }
    
    func bold() -> UIFont {
        withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}
