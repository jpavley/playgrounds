import UIKit

var str = "Hello, playground"

/// Int Array Map Function: Adds a value to each element of an array of integers and returns
/// the resulting array
///
/// - Parameters:
///   - delta: value to add to each element of the array
///   - array: array of values to increment
/// - Returns: array of sums where each member of the original array is incremented
func increment(by delta: Int, to array: [Int]) -> [Int] {
    var result = [Int]()
    for element in array {
        result.append(element + delta)
    }
    return result
}

increment(by: 2, to: [0,1,2,3,4,5])
increment(by: 1, to: [3,2,1])

/// Int Array Map Function: Doubles each element of an array of integers and returns the
/// resulting array
///
/// - Parameter array: array of values to double
/// - Returns: array of products where each member of the original array is doubled
func square(_ array: [Int]) -> [Int] {
    var result = [Int]()
    for element in array {
        result.append(element * element)
    }
    return result
}

square([2,3,4,5])

/// Int Array Map Function: Applies a function to each element of an array of Integers and
/// returns the resulting array
///
/// - Parameters:
///   - array: array of values to transform
///   - transform: function that performs an integer operation
/// - Returns: array where each element of the original array is transformed
func apply(for array: [Int], transform: (Int) -> Int) -> [Int] {
    var result = [Int]()
    for element in array {
        result.append(transform(element))
    }
    return result
}

let list1 = apply(for: [1,2,3,4,5]) { $0 * 3 }
print(list1)

let list2 = apply(for: [1,2,3,4,5], transform: {
    i in i + 3
})
print(list2)

let list3 = apply(for: [1,2,3,4,5]) { (i) -> Int in
    i - 3
}
print(list3)


/// Generic Array Map Function: Applies a function to each element of an array of Integers and
/// returns the resulting array of any type
///
/// - Parameters:
///   - array: array of values to transform
///   - transform: function that performs an operation
/// - Returns: array where each element of the original array is transformed
func genericApply<T>(to array: [Int], transform: (Int) -> T) -> [T] {
    var result = [T]()
    for element in array {
        result.append(transform(element))
    }
    return result
}

let list4 = genericApply(to: [1,2,3,4,5]) {
    "\($0) cat"
}
print(list4)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var number1 = 3
var number2 = 107
print("number1 \(number1), number2 \(number2)")

swapTwoInts(&number1, &number2)
print("number1 \(number1), number2 \(number2)")

func swapTwoValues<V>(_ a: inout V, _ b: inout V) {
    let c = a
    a = b
    b = c
}

var string1 = "cat"
var string2 = "dog"
print("string1 \(string1), string2 \(string2)")

swapTwoValues(&string1, &string2)
print("string1 \(string1), string2 \(string2)")










