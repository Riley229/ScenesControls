/*
ScenesControls provides a Swift object library with support for common
controls.  ScenesControls runs on top of Scenes and IGIS.
Copyright (C) 2021 Tango Golf Digital, LLC
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import Igis

/// A `Theme` provides default global values for each control type.
public struct Theme {
    public var `default` : ControlStyle
    public var button : ControlStyle
    public var panel : ControlStyle
    public var textLabel : ControlStyle

    /// Creates a new `Theme` from the provided parameters.
    public init(`default`: ControlStyle? = nil,
                button: ControlStyle? = nil,
                panel: ControlStyle? = nil,
                textLabel: ControlStyle? = nil) {
        self.default     = `default`   ?? ControlStyle()
        self.button      = button      ?? ControlStyle()
        self.panel       = panel       ?? ControlStyle()
        self.textLabel   = textLabel   ?? ControlStyle()
    }

    /// Returns this `Theme`s controlStyle for the cooresponding stylable type.
    public subscript(_ type:Stylable.Type) -> ControlStyle {
        switch type {
        case is Button.Type:
            return button
        case is Panel.Type:
            return panel
        case is TextLabel.Type:
            return textLabel
        default:
            return `default`
        }
    }

    internal func font(for type:Stylable.Type) -> String {
        return self[type].font
          ?? `default`.font
          ?? "20px Arial"
    }

    internal func textFillMode(for type:Stylable.Type) -> FillMode {
        return self[type].textFillMode
          ?? `default`.textFillMode
          ?? FillMode.fill
    }

    internal func textStrokeStyle(for type:Stylable.Type) -> StrokeStyle {
        return self[type].textStrokeStyle
          ?? `default`.textStrokeStyle
          ?? StrokeStyle(color:Color(.black))
    }

    internal func textFillStyle(for type:Stylable.Type) -> FillStyle {
        return self[type].textFillStyle
          ?? `default`.textFillStyle
          ?? FillStyle(color:Color(.white))
    }

    internal func foregroundStrokeStyle(for type:Stylable.Type) -> StrokeStyle {
        return self[type].foregroundStrokeStyle
          ?? `default`.foregroundStrokeStyle
          ?? StrokeStyle(color:Color(red:0x9F, green:0xB4, blue:0xF2))
    }

    internal func backgroundFillStyle(for type:Stylable.Type) -> FillStyle {
        return self[type].backgroundFillStyle
          ?? `default`.backgroundFillStyle
          ?? FillStyle(color:Color(red:0x67, green:0x85, blue:0xB4))
    }

    internal func backgroundHoverFillStyle(for type:Stylable.Type) -> FillStyle {
        return self[type].backgroundHoverFillStyle
          ?? `default`.backgroundHoverFillStyle
          ?? FillStyle(color:Color(red:0x77, green:0x95, blue:0xD4))
    }

    internal func roundingPercentage(for type:Stylable.Type) -> Double {
        return self[type].roundingPercentage
          ?? `default`.roundingPercentage
          ?? 0.20
    }

    internal func padding(for type:Stylable.Type) -> Int {
        return self[type].padding
          ?? `default`.padding
          ?? 5
    }

    internal func normalCursorStyle(for type:Stylable.Type) -> CursorStyle.Style {
        return self[type].normalCursorStyle
          ?? `default`.normalCursorStyle
          ?? CursorStyle.Style.defaultCursor
    }

    internal func hoverCursorStyle(for type:Stylable.Type) -> CursorStyle.Style {
        return self[type].hoverCursorStyle
          ?? `default`.hoverCursorStyle
          ?? CursorStyle.Style.pointer
    }

    internal func labelsDisplayEnclosingRect(for type:Stylable.Type) -> Bool {
        return self[type].labelsDisplayEnclosingRect
          ?? `default`.labelsDisplayEnclosingRect
          ?? false
    }
}
