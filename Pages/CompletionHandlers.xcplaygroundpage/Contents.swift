import Foundation

//MARK:-  STANDARD
func sample() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("delayed")
    }
}

// sample()

func sample2() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
        print("Delay this")
    }
    print("Send this on time")
}

// sample2()

//MARK:- COMPLETION BLOCK

/*
 block of code that will be executed after the main task is completed
 */

func sampleCompletion(completion: @escaping () -> ()) {
    
    // escaping - closure that called after the function returns, outlives the function
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        // waits 2 seconds to print
        print("Print first")
        completion()
    }
}

sampleCompletion {
    print("Print second")
}

func sample4(completion: @escaping (String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Response from delayed closure")
        completion("Response from completion after the function call")
    }
}

sample4 { response in
    print(response) // completion code
}

//MARK:- PARAMETER + ESCAPING CLOSURE
func sample5(query: String, completion: @escaping (String) -> ()) {
    print("You searched for \(query)")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        completion("\(query): is what you searched for")
    }
}

sample5(query: "NBA") { response in
    print(response)
}
