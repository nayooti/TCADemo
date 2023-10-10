import ComposableArchitecture
import DemoFramework
import SwiftUI

struct ContentView: View {
    let store = StoreOf<DemoFeature>(
        initialState: DemoFeature.State()
    ) {
        DemoFeature()
    }

    var body: some View {
        DemoView(store: store)
    }
}

#Preview {
    ContentView()
}
