//
//  DetailView.swift
//  RealityShaderExtensionDemo
//
//  Created by 许同学 on 2025/1/12.
//

import SwiftUI
import RealityKit
import RealityShaderExtension

struct DetailView: View {
    var module: Module
    var body: some View {
        VStack {
            Model3D(named: module.usdFileName, bundle: realityShaderExtensionBundle) { model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .padding(.bottom, 50)
            
            Text(module.name)

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview {
    DetailView(module: .Unity)
}
