//
//  AppModel.swift
//  RealityShaderExtensionDemo
//
//  Created by 许同学 on 2024/12/12.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    
    var immersiveSpaceState = ImmersiveSpaceState.closed
    var selectedModule: Module = .Unity
}

enum Module: String, Identifiable, CaseIterable, Equatable {
    case Unity
    case Unreal
    case ColorBlend
    
    var id: Self { self }
    var name: String {
        rawValue + "Material"
    }

    var immersiveId: String {
        self.rawValue + "ID"
    }
    
    var usdFileName: String {
        switch self {
        case .Unity: return "Materials/UnityMaterial"
        case .Unreal: return "Materials/UEMaterial"
        case .ColorBlend: return "Materials/ColorBlendMaterial"
        }
    }
}
