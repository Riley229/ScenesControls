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
  
/// A `ControlStyle` provides information for styling controls.
///
/// `ControlStyle` also contains a static `theme` variable which
/// can be used for establishing global styling defaults.
///
/// When accessing a `ControlStyle` property, the order of importance
/// is as follows: This controlStyle (if specified), the theme
/// controlStyle for this `Stylable` object (if specified), the theme
/// default controlStyle (if specified).
public struct ControlStyle {
    /// The global `Theme` applied to all `ControlStyle`s.
    public static var theme = Theme()

    // The type of its parent (set by `Stylable` object).
    internal var type : Stylable.Type = Control.self

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
        self.font                       = font
        self.textFillMode               = textFillMode
        self.textStrokeStyle            = textStrokeStyle
        self.textFillStyle              = textFillStyle
        
        self.foregroundStrokeStyle      = foregroundStrokeStyle
        self.backgroundFillStyle        = backgroundFillStyle
        self.backgroundHoverFillStyle   = backgroundHoverFillStyle

        self.roundingPercentage         = roundingPercentage
        self.padding                    = padding

        self.normalCursorStyle          = normalCursorStyle
        self.hoverCursorStyle           = hoverCursorStyle

        self.labelsDisplayEnclosingRect = labelsDisplayEnclosingRect
    }

    internal var _font : String {
        return font ?? Self.theme.font(for:type)
    }

    internal var _textFillMode : FillMode {
        return textFillMode ?? Self.theme.textFillMode(for:type)
    }

    internal var _textStrokeStyle : StrokeStyle {
        return textStrokeStyle ?? Self.theme.textStrokeStyle(for:type)
    }

    internal var _textFillStyle : FillStyle {
        return textFillStyle ?? Self.theme.textFillStyle(for:type)
    }

    internal var _foregroundStrokeStyle : StrokeStyle {
        return foregroundStrokeStyle ?? Self.theme.foregroundStrokeStyle(for:type)
    }

    internal var _backgroundFillStyle : FillStyle {
        return backgroundFillStyle ?? Self.theme.backgroundFillStyle(for:type)
    }

    internal var _backgroundHoverFillStyle : FillStyle {
        return backgroundHoverFillStyle ?? Self.theme.backgroundHoverFillStyle(for:type)
    }

    internal var _roundingPercentage : Double {
        return roundingPercentage ?? Self.theme.roundingPercentage(for:type)
    }

    internal var _padding : Int {
        return padding ?? Self.theme.padding(for:type)
    }

    internal var _normalCursorStyle : CursorStyle.Style {
        return normalCursorStyle ?? Self.theme.normalCursorStyle(for:type)
    }

    internal var _hoverCursorStyle : CursorStyle.Style {
        return hoverCursorStyle ?? Self.theme.hoverCursorStyle(for:type)
    }

    internal var _labelsDisplayEnclosingRect : Bool {
        return labelsDisplayEnclosingRect ?? Self.theme.labelsDisplayEnclosingRect(for:type)
    }
}
