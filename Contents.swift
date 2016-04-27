//: Playground - noun: a place where people can play

import UIKit

func highlightMatches(pattern: String, inString string: String) -> NSAttributedString {
    let regex = try! NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
    let range = NSMakeRange(0, string.characters.count)
    let matches = regex.matchesInString(string, options: [], range: range) 

    let attributedText = NSMutableAttributedString(string: string)

    for match in matches {
        attributedText.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: match.range)
    }

    return attributedText.copy() as! NSAttributedString
}

func listMatches(pattern: String, inString string: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
    let range = NSMakeRange(0, string.characters.count)
    let matches = regex.matchesInString(string, options: [], range: range)

    return matches.map {
        let range = $0.range
        return (string as NSString).substringWithRange(range)
    }
}

func listGroups(pattern: String, inString string: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
    let range = NSMakeRange(0, string.characters.count)
    let matches = regex.matchesInString(string, options: [], range: range)

    var groupMatches = [String]()
    for match in matches {
        let rangeCount = match.numberOfRanges

        for group in 0..<rangeCount {
            groupMatches.append((string as NSString).substringWithRange(match.rangeAtIndex(group)))
        }
    }

    return groupMatches
}

func containsMatch(pattern: String, inString string: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
    let range = NSMakeRange(0, string.characters.count)
    return regex.firstMatchInString(string, options: [], range: range) != nil
}

func replaceMatches(pattern: String, inString string: String, withString replacementString: String) -> String? {
    let regex = try! NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
    let range = NSMakeRange(0, string.characters.count)

    return regex.stringByReplacingMatchesInString(string, options: [], range: range, withTemplate: replacementString)
}


let quickFox = "^I tap (?:the )?\"([^\\\"]*)\" (button|label|tab|view|field|textView)$"
listMatches("I tap the \"Add Activity\" button", inString: quickFox)
listGroups("I tap the \"Add Activity\" button", inString: quickFox)


