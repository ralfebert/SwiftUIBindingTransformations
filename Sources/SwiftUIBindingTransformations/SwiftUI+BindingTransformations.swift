import SwiftUI

/// The fallback operator '??' adapted to SwiftUI bindings: return the original value if the given Binding has a wrappedValue, otherwise the fallback value will be used.
/// see also: https://stackoverflow.com/questions/57021722/swiftui-optional-textfield
public func ?? <T: Equatable>(lhs: Binding<T?>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = ($0 == rhs) ? .none : $0 }
    )
}

/// Returns a Binding for an Binding with an optional value that contains the unwrapped value. This will crash when the value becomes nil.
public func forceUnwrap<T>(_ binding: Binding<T?>) -> Binding<T> {
    Binding(
        get: { binding.wrappedValue! },
        set: { binding.wrappedValue = $0 }
    )
}

/// Returns an optional Binding for a non-optional Binding
public func makeOptional<T>(_ binding: Binding<T>) -> Binding<T?> {
    Binding(
        get: { binding.wrappedValue },
        set: { if let value = $0 { binding.wrappedValue = value } }
    )
}

/// Returns a binding that has the value true if the given binding has a wrappedValue. If the wrappedValue of the returned binding is set to false, the original binding is set to nil.
public func hasValue<T>(_ binding: Binding<T?>) -> Binding<Bool> {
    Binding(
        get: { binding.wrappedValue != nil },
        set: { newValue in if !newValue { binding.wrappedValue = nil } }
    )
}

/// Returns a Binding that is true if the value of `binding` equals `value`. If the value of the resulting binding is set to true, the original binding is set to value.
public func isEqual<T: Equatable>(_ binding: Binding<T>, _ value: T) -> Binding<Bool> {
    Binding(
        get: { binding.wrappedValue == value },
        set: { newValue in if newValue { binding.wrappedValue = value } }
    )
}

/// Returns a Binding that is true if the value of `binding` equals `value`. If the value of the resulting binding is set, the original binding is set to value/inEqualValue.
public func isEqual<T: Equatable>(_ binding: Binding<T>, _ value: T, inEqualValue: T) -> Binding<Bool> {
    Binding(
        get: { binding.wrappedValue == value },
        set: { newValue in binding.wrappedValue = newValue ? value : inEqualValue }
    )
}
