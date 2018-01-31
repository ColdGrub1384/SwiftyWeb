# SwiftyWeb

![Swift](https://img.shields.io/badge/swift-3-orange.svg)
<a href="https://coldgrub1384.github.io/SwiftyWeb/"><img src="https://coldgrub1384.github.io/SwiftyWeb/badge.svg"></a>

## Swift library for CGI

- [x] Global variables and functions
- [x] No need to recompile for each edit (but supported)
- [x] Automatic library integration, no Package Manager
- [x] Show compiler errors in browser
- [ ] MySQL

SwiftyWeb includes a Swift helper for CGI.

You can use it like this:
```swift
// GET
"h1".htm() {
    print("GET Parameters")
}

"ul".htm() {
    for (key, value) in GET {
        "li".htm() {
            print(key+":"+value)
        }
    }
}

// POST
"h1".htm() {
    print("POST Parameters")
}

"ul".htm() {
    for (key, value) in POST {
        "li".htm() {
            print(key+":"+value)
        }
    }
}
```
# Usage
Init a project, install via the package manager, compile and move?

NO.

With SwiftyWeb, you can simply write your code and open the browser.

## Linux and Mac

Install typing this in a shell:

    curl https://raw.githubusercontent.com/ColdGrub1384/SwiftyWeb/master/install 2>/dev/null | sudo bash

### Slow method
Now, you can write Swift CGIs putting this in the top or your file:

    #!/usr/bin/swiftw

    // Your code here
    (Don't forget to chmod +x your file)

You can also include other files:

    #!/usr/bin/swiftw AnotherFile.swift

    // Your code here

### Fast method
Loading CGIs with '#!/usr/bin/swiftw' is very slow, you can compile files manually typing:

swiftw -o PATH_TO_NEW_EXECUTABLE FILES TO COMPILE

A file will be created and you can put it in your CGI's folder.

## Mac

In Mac, you can also build the framework opening `SwiftyWeb.xcodeproj` and include framework in your command line project. Don't forgot to print `"Content-Type: text/html\nContent:\n"`!
