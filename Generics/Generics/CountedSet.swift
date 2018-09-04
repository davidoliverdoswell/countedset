//
//  CountedSet.swift
//  Generics
//
//  Created by Lambda-School-Loaner-11 on 9/4/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

struct CountedSet<Element> where Element: Hashable {
    
    // protocol stubbs for Equatable to which Hashable conforms
    
    static func == (lhs: CountedSet<Element>, rhs: CountedSet<Element>) -> Bool { return true }
    
    // backing storage
    
    private(set) var items: [Element:Int] = [:]
    
    // Hashable protocol conformance
    
    private var count: Int
    
    // initialize class properties
    
    init(_ elements: [Element]) {
        self.count = elements.count
    }
    
    // insert new element
    
    mutating func insert(_ newElement: Element) -> Int {
        items[newElement, default: 0] += 1
        return items[newElement] ?? 0

    }
    
    // remove last element
    
    mutating func remove(_ oldElement: Element) -> Int {
        let item = items[oldElement, default: 0]
        
        if item > 1 {
            items[oldElement] = item - 1
            return item - 1
        }
        
        if item == 1 {
            items.removeValue(forKey: oldElement)
            return 0
        }
        
        return items.count
    }
    
    // support subscripting to look up current values
    // return 0 for any value that is not found.
    
    subscript(_ member: Element) -> Int {
        return items[member] ?? 0
    }
}
