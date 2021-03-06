// Copyright 2020 Tokamak contributors
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
//
//  Created by Jed Fox on 06/28/2020.
//

import TokamakCore

public typealias TextField = TokamakCore.TextField

func css(for style: TextFieldStyle) -> String {
  if style is PlainTextFieldStyle {
    return """
      background: transparent;
      border: none;
    """
  } else {
    return ""
  }
}

extension TextField: ViewDeferredToRenderer where Label == Text {
  public var deferredBody: AnyView {
    let proxy = _TextFieldProxy(self)

    return AnyView(HTML("input", [
      "type": proxy.textFieldStyle is RoundedBorderTextFieldStyle ? "search" : "text",
      "value": proxy.textBinding.wrappedValue,
      "placeholder": proxy.label.content,
      "style": css(for: proxy.textFieldStyle),
    ], listeners: [
      "focus": { _ in proxy.onEditingChanged(true) },
      "blur": { _ in proxy.onEditingChanged(false) },
      "keypress": { event in if event.key == "Enter" { proxy.onCommit() } },
      "input": { event in
          if let newValue = event.target.object?.value.string {
            proxy.textBinding.wrappedValue = newValue
          }
        },
    ]))
  }
}
