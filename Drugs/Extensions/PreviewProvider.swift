//
//  PreviewProvider.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let mainVM = MainViewModel()
}
