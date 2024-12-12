//
//  ContentView.swift
//  RealityShaderExtensionDemo
//
//  Created by 许同学 on 2024/12/12.
//

import SwiftUI
import RealityKit
import RealityShaderExtension

struct ContentView: View {

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityShaderExtensionBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
