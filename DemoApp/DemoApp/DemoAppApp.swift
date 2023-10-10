import SwiftUI
import DemoFramework
import ComposableArchitecture

@main
struct DemoAppApp: App {

    let store = StoreOf<DemoFeature>(
        initialState: DemoFeature.State()
    ) {
        DemoFeature()
    }
    var body: some Scene {
        WindowGroup {
            DemoView(store: store)
        }
    }
}
