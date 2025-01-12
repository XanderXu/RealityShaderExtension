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
    @Environment(AppModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    var body: some View {
        NavigationSplitView {
            List(Module.allCases) { module in
                Button(action: {
                    model.selectedModule = module
                }, label: {
                    Text(module.name)
                })
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 8)
                        .background(Color.clear)
                        .foregroundColor((module == model.selectedModule) ? Color.teal.opacity(0.3) : .clear)
                )
                
            }
            .navigationTitle("ShaderExtension Material Demo")
        } detail: {
            DetailView(module: model.selectedModule)
                .navigationTitle(model.selectedModule.name)
        }
        .frame(minWidth: 800, minHeight: 500)
        .onChange(of: model.selectedModule) { oldValue, newValue in
            Task {
                await dismissImmersiveSpace()
            }
        }
    }
    
}

#Preview {
    ContentView()
        .environment(AppModel())
}
