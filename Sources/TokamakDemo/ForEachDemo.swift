// Copyright 2019-2020 Tokamak contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if canImport(SwiftUI)
import SwiftUI
#else
import TokamakDOM
#endif

public struct ForEachDemo: View {
  @State public var maxItem = 0

  public var body: some View {
    VStack {
      Button(action: { maxItem += 1 }) {
        Text("Add item")
      }

      ForEach(0..<maxItem, id: \.self) {
        Text("Item: \($0)")
      }
    }
  }
}
