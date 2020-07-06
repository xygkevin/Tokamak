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

import TokamakCore

public typealias Divider = TokamakCore.Divider

extension Divider: AnyHTML {
  var innerHTML: String? { nil }
  var tag: String { "hr" }
  var attributes: [String: String] {
    [
      "style": """
      width: 100%; height: 0; margin: 0;
      border-top: none;
      border-right: none;
      border-bottom: 1px solid rgba(0, 0, 0, 0.2);
      border-left: none;
      """,
    ]
  }

  var listeners: [String: Listener] { [:] }
}
