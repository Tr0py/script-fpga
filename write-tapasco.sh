# Write a tapasco program


# Writing Json file

* Files: kernel --> HLS 
* TestbenchFiles: host program --> GCC
* Arguments: 
    * Passsing: by reference / by value

Eg. 


```
{
    "Name" : "rot13",
    "Version" : "1.0",
    "Id" : 13,
    "Files" : ["rot13.cpp"],  
    "CompilerFlags" : ["-std=c++11"],
    "TestbenchFiles" : ["rot13.cpp"],
    "TestbenchCompilerFlags" : ["-std=c++0x"],
    "TopFunction" : "rot13",
    "Arguments" : [
        { "Name" : "len" },
        { "Name" : "text_in", "Passing" : "by reference" },
        { "Name" : "text_out", "Passing" : "by reference" }
    ]
}
```

