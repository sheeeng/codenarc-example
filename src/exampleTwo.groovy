
// do not add empty strings to things
def g = '' + 123
def h = method('' + property)

// these examples are OK and do not trigger violations
def i = 456.toString()
def j = property?.toString() ?: ""

int myMethod() {
    new String[3]               // unused
    return -1
}

String[] myMethod() {
    new String[3]               // OK (last statement in block)
}

def closure = {
    doStuff()
    new Date[3]                 // unused
    doOtherStuff()
}

def closure = { new Date[3] }   // OK (last statement in block)
