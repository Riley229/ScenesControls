/*
ScenesControls provides a Swift object library with support for common
controls.  ScenesControls runs on top of Scenes and IGIS.
Copyright (C) 2020-2021 Tango Golf Digital, LLC
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
  
/// This struct provides information for styling controls.
/// It also provides the static theme variable which can be used
/// for establishing global defaults.
/// The struct is copied when used so the original may be altered
/// prior to the next use without affecting previous controls.
public struct ControlStyle {
    /// The global `Theme` applied to all `ControlStyle`s.
    public static var theme = Theme()

    // stores the type of its parented control (set by `Control` or `Panel`).
    internal var controlType : Any.Type = Control.self

    // Text Style
    public var font                  : String?
    public var textFillMode          : FillMode?
    public var textStrokeStyle       : StrokeStyle?
    public var textFillStyle         : FillStyle?
    
    // Foreground and Background Style
    public var foregroundStrokeStyle    : StrokeStyle?
    public var backgroundFillStyle      : FillStyle?
    public var backgroundHoverFillStyle : FillStyle?

    // Rounding Percentage (0.0 is square, 0.5 is maximum)
    public var roundingPercentage    : Double?
    // Padding (between lines and text)
    public var padding               : Int?

    // Cursor Style
    public var normalCursorStyle : CursorStyle.Style?
    public var hoverCursorStyle  : CursorStyle.Style?

    // Labels display enclosing rectangle
    public var labelsDisplayEnclosingRect : Bool?

    /// Creates a new `ControlStyle` from the provided parameters.
    public init(font:String? = nil,
                textFillMode:FillMode? = nil,
                textStrokeStyle:StrokeStyle? = nil,
                textFillStyle:FillStyle? = nil,
                
                foregroundStrokeStyle:StrokeStyle? = nil,
                backgroundFillStyle:FillStyle? = nil,
                backgroundHoverFillStyle:FillStyle? = nil,
                
                roundingPercentage:Double? = nil,
                padding:Int? = nil,
                
                normalCursorStyle:CursorStyle.Style? = nil,
                hoverCursorStyle:CursorStyle.Style? = nil,

                labelsDisplayEnclosingRect:Bool? = nil)
    {
        self.font                     = font
        self.textFillMode             = textFillMode
        self.textStrokeStyle          = textStrokeStyle
        self.textFillStyle            = textFillStyle
        
        self.foregroundStrokeStyle    = foregroundStrokeStyle
        self.backgroundFillStyle      = backgroundFillStyle
        self.backgroundHoverFillStyle = backgroundHoverFillStyle

        self.roundingPercentage       = roundingPercentage
        self.padding                  = padding

        self.normalCursorStyle        = normalCursorStyle
        self.hoverCursorStyle         = hoverCursorStyle

        self.labelsDisplayEnclosingRect = labelsDisplayEnclosingRect
    }

    internal var _font : String {
        return font ?? Self.theme.font(for:controlType)
    }

    internal var _textFillMode : FillMode {
        return textFillMode ?? Self.theme.textFillMode(for:controlType)
    }

    internal var _textStrokeStyle : StrokeStyle {
        return textStrokeStyle ?? Self.theme.textStrokeStyle(for:controlType)
    }

    internal var _textFillStyle : FillStyle {
        return textFillStyle ?? Self.theme.textFillStyle(for:controlType)
    }

    internal var _foregroundStrokeStyle : StrokeStyle {
        return foregroundStrokeStyle ?? Self.theme.foregroundStrokeStyle(for:controlType)
    }

    internal var _backgroundFillStyle : FillStyle {
        return backgroundFillStyle ?? Self.theme.backgroundFillStyle(for:controlType)
    }

    internal var _backgroundHoverFillStyle : FillStyle {
        return backgroundHoverFillStyle ?? Self.theme.backgroundHoverFillStyle(for:controlType)
    }

    internal var _roundingPercentage : Double {
        return roundingPercentage ?? Self.theme.roundingPercentage(for:controlType)
    }

    internal var _padding : Int {
        return padding ?? Self.theme.padding(for:controlType)
    }

    internal var _normalCursorStyle : CursorStyle.Style {
        return normalCursorStyle ?? Self.theme.normalCursorStyle(for:controlType)
    }

    internal var _hoverCursorStyle : CursorStyle.Style {
        return hoverCursorStyle ?? Self.theme.hoverCursorStyle(for:controlType)
    }

    internal var _labelsDisplayEnclosingRect : Bool {
        return labelsDisplayEnclosingRect ?? Self.theme.labelsDisplayEnclosingRect(for:controlType)
    }
}
