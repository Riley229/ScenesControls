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

public struct Theme {
    // Theme variables
    public var defaultStyle : ControlStyle
    public var buttonStyle : ControlStyle
    public var panelStyle : ControlStyle
    public var textLabelStyle : ControlStyle

    public init(defaultStyle: ControlStyle? = nil,
                buttonStyle: ControlStyle? = nil,
                panelStyle: ControlStyle? = nil,
                textLabelStyle: ControlStyle? = nil) {
        self.defaultStyle = defaultStyle ?? ControlStyle()
        self.buttonStyle = buttonStyle ?? ControlStyle()
        self.panelStyle = panelStyle ?? ControlStyle()
        self.textLabelStyle = textLabelStyle ?? ControlStyle()
    }

    private func getStyle(forType type:Any.Type) -> ControlStyle {
        switch type {
        case is Button.Type:
            return buttonStyle
        case is Panel.Type:
            return panelStyle
        case is TextLabel.Type:
            return textLabelStyle
        default:
            return defaultStyle
        }
    }

    internal func font(for controlType:Any.Type) -> String {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.font ?? defaultStyle.font ?? "20px Arial"
    }

    internal func textFillMode(for controlType:Any.Type) -> FillMode {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.textFillMode ?? defaultStyle.textFillMode ?? FillMode.fill
    }

    internal func textStrokeStyle(for controlType:Any.Type) -> StrokeStyle {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.textStrokeStyle ?? defaultStyle.textStrokeStyle ?? StrokeStyle(color:Color(.black))
    }

    internal func textFillStyle(for controlType:Any.Type) -> FillStyle {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.textFillStyle ?? defaultStyle.textFillStyle ?? FillStyle(color:Color(.white))
    }

    internal func foregroundStrokeStyle(for controlType:Any.Type) -> StrokeStyle {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.foregroundStrokeStyle ?? defaultStyle.foregroundStrokeStyle ?? StrokeStyle(color:Color(red:0x9F, green:0xB4, blue:0xF2))
    }

    internal func backgroundFillStyle(for controlType:Any.Type) -> FillStyle {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.backgroundFillStyle ?? defaultStyle.backgroundFillStyle ?? FillStyle(color:Color(red:0x67, green:0x85, blue:0xB4))
    }

    internal func backgroundHoverFillStyle(for controlType:Any.Type) -> FillStyle {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.backgroundHoverFillStyle ?? defaultStyle.backgroundHoverFillStyle ?? FillStyle(color:Color(red:0x77, green:0x95, blue:0xD4))
    }

    internal func roundingPercentage(for controlType:Any.Type) -> Double {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.roundingPercentage ?? defaultStyle.roundingPercentage ?? 0.20
    }

    internal func padding(for controlType:Any.Type) -> Int {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.padding ?? defaultStyle.padding ?? 5
    }

    internal func normalCursorStyle(for controlType:Any.Type) -> CursorStyle.Style {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.normalCursorStyle ?? defaultStyle.normalCursorStyle ?? CursorStyle.Style.defaultCursor
    }

    internal func hoverCursorStyle(for controlType:Any.Type) -> CursorStyle.Style {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.hoverCursorStyle ?? defaultStyle.hoverCursorStyle ?? CursorStyle.Style.pointer
    }

    internal func labelsDisplayEnclosingRect(for controlType:Any.Type) -> Bool {
        let controlStyle = getStyle(forType:controlType)
        return controlStyle.labelsDisplayEnclosingRect ?? defaultStyle.labelsDisplayEnclosingRect ?? false
    }
}
