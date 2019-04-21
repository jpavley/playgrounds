import UIKit

// Fizz Buzz
// If the number is a multiple of 3 print "fizz"
// if the number is a multiple of 5 print "buzz"
// if the number is a multiple of both 3 and 5 print "fizzbuzz"


extension Int {
    func isMultiple(of other: Int) -> Bool {
        // watch out for division by 0!
        if other == 0 {
            return false
        }
        return self % other == 0
    }
}


// Simple for loop
/**
for num in 0...100 {
}
**/

// Advanced for each loop (uses a closure)

(0...100).forEach { (num) in
    //print(num )
    
    //let multipleOfThree = num.isMultiple(of: 3)
    //let multipleOfFive = num.isMultiple(of: 5)
    let _ = num.isMultiple(of: 0) // division by zero
    var magicWord = ""
    
    // if else
    
    /**
    
    if multipleOfThree && multipleOfFive { // or test for 15 (3x5)
        
        magicWord = "fizzbuzz"
        
    } else {
        
        if multipleOfThree {
            
            magicWord = "fizz"
            
        } else if multipleOfFive {
            
            magicWord = "buzz"
        }
    }
 
    **/
    
    // basic switch
    
    /**
    
    switch (multipleOfThree, multipleOfFive) {
    case (true, true):
        magicWord = "fizzbuzz"
    case (true, false):
        magicWord = "fizz"
    case (false, true):
        magicWord = "buzz"
    default:
        magicWord = ""
    }
 
    **/
    
    // advanced switch
    
    switch num {
    case let n where n.isMultiple(of: 15):
        magicWord = "fizzbuzz"
    case let n where n.isMultiple(of: 3):
        magicWord = "fizz"
    case let n where n.isMultiple(of: 5):
        magicWord = "buzz"
    default:
        magicWord = ""
    }

    
    //if magicWord != "" {
        print("\(num) \(magicWord)")
    //}

}
