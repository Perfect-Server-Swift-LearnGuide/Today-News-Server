//
//  TNStringExtension.swift
//  Today-News-Server
//
//  Created by 百城 on 16/11/1.
//
//

public extension String{
    public func charAt(index:Int)->Character?{
        if index >= self.characters.count || index < 0{
            return nil
        }
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    subscript (range: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            return self[Range(startIndex..<endIndex)]
        }
        
        set {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            let strRange = Range(startIndex..<endIndex)
            self.replaceSubrange(strRange, with: newValue)
        }
    }
}
