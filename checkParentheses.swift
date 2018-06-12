import UIKit

//Write a program that check that an equation or a program is syntactically correct, meaning that all parentheses (), [], {} are balanced.
//
//Input: String containing an equation or a program.
//
//Output: 0 for FALSE or 1 for TRUE.
//
//Example:
//
//For the following input: chec, the output is 0.

func validBraces(_ string:String) -> Bool {
    var popup = [Character]()
    let rightP: [Character] = [")", "}", "]"]
    let leftP: [Character] = ["(", "{", "["]
    
    
    func rightParentheses(caract: Character) -> Int? {
        switch caract {
        case ")":
            return 0
        case "}":
            return 1
        case "]":
            return 2
        default:
            return nil
        }
    }
    
    func leftParentheses(caract: Character) -> Int? {
        switch caract {
        case "(":
            return 0
        case "{":
            return 1
        case "[":
            return 2
        default:
            return nil
        }
    }
    
    for i in string {
        if let lindex = leftParentheses(caract: i) {
            popup.append(leftP[lindex])
        } else if let rindex = rightParentheses(caract: i) {
            if let lastElement = popup.last {
                if let lindex = leftParentheses(caract: lastElement) {
                    if lindex == rindex {
                        popup.removeLast()
                    } else {
                        return false
                    }
                }
            } else{
                return false
            }
        }
    }
    return popup.isEmpty
}

//print(validBraces("([{}])"))) //true
//print(validBraces("(}")) //false
//print(validBraces("[(])")) //false
//print(validBraces("({})[({})]")) //true
//print(validBraces("(})")) //false
//print(validBraces("(({{[[]]}}))")) //true
//print(validBraces("{}({})[]")) //true
//print(validBraces(")(}{][")) //false
//print(validBraces("())({}}{()][][")) //false
//print(validBraces("(((({{")) //false
//print(validBraces("}}]]))}])")) //false

