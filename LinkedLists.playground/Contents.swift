//: Playground - noun: a place where people can play

import UIKit

// LINKED LISTS

//A linked list is a basic data structure that provides a way to associate related content. At a basic level, linked lists provide the same functionality as an array. That is, the ability to insert, retrieve, update and remove related items. However, if properly implemented, linked lists can provide ad- ditional flexibility. Since objects are managed independently (instead of contiguously - as with an array), lists can prove useful when dealing with large datasets.

//HOW IT WORKS
//In its basic form, a linked list is comprised of a key and an indicator. The key represents the data you would like to store such as a string or scalar value. Typically represented by a pointer, the indicator stores the location (also called the address) of where the next item can be found. Using this technique, you can chain seemingly independent objects together.

//THE DATA STRUCTURE
//Here’s an example of a “doubly” linked list structure written in Swift. In addition to storing a key, the structure also provides pointers to the next and previous items. Using generics, the struc- ture can also store any type of object and supports nil values. The concept of combining keys and pointers to create structures not only applies to linked lists, but to other objects like tries, queues and graphs.

//generic doubly linked list structure
/*
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


//REMOVING LINKS
//Conversely, here’s an example of removing items from a list. Removing links not only involves reclaiming memory (for the deleted item), but also reassigning links so the chain remains unbro- ken.

//remove at specific index

func removeLinkAtIndex(index: Int) {
    
    //check for nil conditions
    if ((index < 0) || (index > self.count - 1)) || (head.key == nil)) {
        print("link index does not exist .. ")
        return
    }
    
    var current: LLNode<T>? = head
    var trailer: LLNode<T>?
    var listIndex: Int = 0
    
    //determine if the removal is at the head
    if (index == 0) {
        current = current?.next
        head = current!
        return
        
    }
    
    //iterate through the remaining items
    while (current != nil) {
        if (listIndex == index) {
            
            //redirect the trailer and next pointers
            trailer!.next = current?.next
            current = nil
            break
            
        }
        
        //update the assignments
        trailer = current
        
        current = current?.next
        listIndex++
    } //end while
    
}//end function

//COUNTING LINKS
//  It can also be convenient to count link items. In Swift, this can be expressed as a computed prop- erty. For example, the following technique will allow a linked list instance to use a dot notation. (e.g., someList.count).


// the number of items

    var count: Int {
        
        if head.key == nil {
            return 0
        }
        else     {
            var current: LLNode = head
            var x: Int = 1
            
            //cycle through the list of items
            while current.next != nil {
                current = current.next!
                x++
            }
            return x
        }
    
}


//EFFICIENCY
// LinkedliststypicallyprovideO(n) forstorageandlookup.Aswe’llsee,linkedlistsareoftenused with other structures to create new models. Algorithms with an efficiency of O(n) are said to run in linear time.

}

*/

//Generics

//student linked list srtucture

//class StudentNode {
//    var key: Student?
//    var next: StudentNode?
//}


//refactored linked list structure
class LLNode<T> {
    var key: T?
    var next: LLNode<T>?
}

//a new list of students
var studentList = LLNode<Student>()

//a new list of teachers
var teacherList = LLNode<Teacher>()


//insert at specific index

func addLinkAtIndex(key: T, index: Int) {
    
    //check for nil conditions 
    if ((index < 0) || (index > (self.count - 1))) {
        print("link index does not exist..")
    }
    
    // establish the head node
    if (head.key == nil) {
        head.key = key
        return
    }
    
    //establish the trailer, current and new items
    var current: LLNode<T>? = head
    var trailer: LLNode<T>?
    var listIndex: Int = 0
    //iterate through the list to find the insertion point
    while (current != nil) {
        if (index == listIndex) {
            var childToUse: LLNode = LLNode<T>() //create the new node
            childToUse.key = key
            //connect the node in front of the current node
            childToUse.next = current
            childToUse.previous = trailer
            //use optional binding when using the trailer
            if let linktrailer = trailer {
                linktrailer.next = childToUse
                childToUse.previous = linktrailer
            }
            //point new node to the current / previous
            current!.previous = childToUse
            //replace the head node if required
            if (index == 0) {
                head = childToUse
            }
            break
            
        } //end if
        
        //iterate through to the next item
        trailer = current
        current = current?.next
        listIndex += 1
    } //end while
    
}
















