for i in 1...100 {
    if i.isMultiple(of: 3){
        print ("Fizz \(i)")
        continue
        }
   else if i.isMultiple(of: 5){
        print ("Buzz \(i)")
        }
    else if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print ("FizzBuzz \(i)")

        }
    else {
        print ("\(i)")
    }
    }
