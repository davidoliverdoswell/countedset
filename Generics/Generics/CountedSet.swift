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
    
    private(set) var items: [Element] = []
    
    // Hashable protocol conformance
    
    private var count: Int
    
    // initialize class properties
    
    init(_ elements: [Element]) {
        items = elements.reversed()
        
        self.count = elements.count
    }
    
    // insert new element
    
    mutating func insert(_ newElement: Element) {
        items.insert(newElement, at: 0)
        
    }
    
    // remove last element
    
    mutating func remove(_ oldElement: Int) -> Element? {
        return items.remove(at: oldElement)
    }
    
    // support subscripting to look up current values
    // return 0 for any value that is not found.
    
    subscript(_ member: Element) -> Int {
        if items.count <= member.hashValue {
            return 0
        }
        return member.hashValue
    }
}
