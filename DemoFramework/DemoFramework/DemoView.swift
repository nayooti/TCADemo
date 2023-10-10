import ComposableArchitecture
import SwiftUI

public struct DemoFeature: Reducer {

    public init() {}
    // comment this out and DemoApp will compile
    @Dependency(\.uuid) var uuid


    public struct State: Equatable {    
        var text = "Hello TCA"
        public init() {}
    }
    public struct Action {}
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

public struct DemoView: View {

    let store: StoreOf<DemoFeature>

    public init(store: StoreOf<DemoFeature>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Text(viewStore.text)
        }
    }
}

#Preview {
    DemoView(store: Store(initialState: DemoFeature.State()) {
        DemoFeature()
    })
}
