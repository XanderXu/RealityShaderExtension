//
//  ImmersiveView.swift
//  RealityShaderExtensionDemo
//
//  Created by 许同学 on 2024/12/12.
//

import SwiftUI
import RealityKit
import RealityShaderExtension

struct ImmersiveView: View {
    @Environment(AppModel.self) private var model
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: model.selectedModule.usdFileName, in: realityShaderExtensionBundle) {
                content.add(immersiveContentEntity)
                immersiveContentEntity.position = [0, 0, -1]
                
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
