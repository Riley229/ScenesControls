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

/// A type capable of handling `ControlStyle`s.
///
/// Types that conform to `Stylable` are capable of accessing style
/// properties through the `ControlStyle` theme attribute.
/// Default implementation should include assigning the type variable
/// in the controlStyle to this object's type upon initialization.
public protocol Stylable {
    var controlStyle : ControlStyle { get }
}
