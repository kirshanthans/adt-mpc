# Obliv-C

[Obliv-C](https://oblivc.org/) is an extension of C that executes a 2-party garbled circuit protocol. The main language addition is an _obliv_ qualifier, applied to C types and constructs. Typing rules enforce that `obliv` types remain secret unless explicitly revealed. 
Code within oblivious functions and conditionals cannot modify public data, except within a qualified _~obliv_ block, which executes in the clear. These rules allow programmers to develop modular libraries and efficient functionalities.

Our recommendation: Obliv-C is a robust garbled circuit framework. We recommend it for general use, particularly to experts who wish to implement and optimize complex libraries such as ORAM.
We note that Obliv-C has been used for multiple practical applications.
Source code is [on Github](https://github.com/samee/obliv-c).

## Docker setup

Create a Docker image. This will take a few minutes. You only have to do 
this once.
```
$ docker build -t obliv-c .
```

Spin up a Docker container from the image.
```
$ docker run -v${PWD}/test:root/test -it --rm obliv-c
```

Please note that any changes you make in the container are not persistent. 

## Architecture
- Obliv-C is an extension of C. 
- The `oblivcc` compiler first converts Obliv-C code
to native C, then combines it with any supporting C code into a single
executable. 
- Obliv-C code is contained in a file with the `.oc` extension, and
supporting code can be either in the `.oc` file or in a `.c` file.

Circuits are generated on the fly (e.g. only in memory). This allows circuit sizes to depend on values not known during compilation.

## Running examples

Navigate to the directory of the program you would like to run, where 
`test` is the name of the program. Our example is at `/root/test`.
```
$ cd test
$ make
```

This should produce an executable `test`. This is run separately on each server:
```
$ ./<binary> <port> <IP> <input file> 
```

We can ran local tests as follows:

```
$ ./test 1234 -- <inputFile1> & 
$ ./test 1234 localhost <inputFile2>
```

## Modifying examples
Modifying examples is straightforward. 
 - Oblivious keywords must be in the `.oc` file. 
 - Rerun `make` to rebuild. 