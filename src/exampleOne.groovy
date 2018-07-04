#!/usr/bin/env groovy

import my.something.*

import static foo.bar.*

println "Hello from Groovy!"

abstract class MyClass {
    MyClass() { }
}

def a = myList.sort()
def b = myList.sort() { it }
def c = myList.sort().findAll { x < 1 }

class MyTest extends GroovyTestCase {
    public void testFoo() {

        // violations, calls test method on self
        5.times { testBar() }
        5.times { this.testBar() }

        // OK, no violation: one arg method is not actually a test method
        5.times { testBar(it) }
    }

    private static void assertSomething() {
        testBar() // violation, even if in helper method
        this.testBar() // violation, even if in helper method
    }

    public void testBar() {
        // ...
    }
}
