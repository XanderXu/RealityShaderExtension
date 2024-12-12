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

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityShaderExtensionBundle) {
                content.add(immersiveContentEntity)

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
