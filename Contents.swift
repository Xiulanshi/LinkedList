//: Playground - noun: a place where people can play

import UIKit

// LINKED LISTS

//A linked list is a basic data structure that provides a way to associate related content. At a basic level, linked lists provide the same functionality as an array. That is, the ability to insert, retrieve, update and remove related items. However, if properly implemented, linked lists can provide ad- ditional flexibility. Since objects are managed independently (instead of contiguously - as with an array), lists can prove useful when dealing with large datasets.

//HOW IT WORKS
//In its basic form, a linked list is comprised of a key and an indicator. The key represents the data you would like to store such as a string or scalar value. Typically represented by a pointer, the indicator stores the location (also called the address) of where the next item can be found. Using this technique, you can chain seemingly independent objects together.

//THE DATA STRUCTURE
//Here’s an example of a “doubly” linked list structure written in Swift. In addition to storing a key, the structure also provides pointers to the next and previous items. Using generics, the struc- ture can also store any type of object and supports nil values. The concept of combining keys and pointers to create structures not only applies to linked lists, but to other objects like tries, queues and graphs.

//generic doubly linked list structure

class LLNode<T> {
    // create a new LLNode instance
    var head: LLNode<T> = LLNode<T>()
    
    var key: T!
    var next: LLNode?
    var previous: LLNode?

//USING OPTIONALS
//When creating algorithms its good practice to set your class properties to nil before they are used. Like with app development, nil can be used to determine missing values or to predict the end of a list. Swift helps enforce this best-practice at compile time through a paradigm called optionals. For example, the function printAllKeys employs an implicit unwrapped optional (e.g., current) to iterate through linked list items.

//print all keys for the class

func printAllKeys() {
    var current: LLNode! = head
    
    //assign the next instance
    while (current != nil) {
        print("link item is: \(current.key)")
        current = current.next
    }
}
}

//ADDING LINKS
//Here’s a function that builds a doubly linked list. The method addLink creates a new item and ap- pends it to the list. The Swift generic type constraint <T: Equatable> is also defined to ensure link instances conform to a specific protocol.

public class LinkedList<T: Equatable> {
    
    //create a new LLNode instance
    private var head: LLNode<T> = LLNode<T>()
    
    //append a new item to a linked list
    func addLink(key: T) {
        
        //establish the head node
        if (head.key == nil) {
            head.key = key
            return
        }
        
        //establish the iteration
        var current: LLNode? = head
        
        while (current != nil) {
            if (current?.next == nil) {
                let childToUse: LLNode = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
            
            current = current?.next
        }//end while
    }//end function
}



















