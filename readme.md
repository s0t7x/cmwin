# cmwin
## get crossplatform cmake projects in windows build with ease

Usage:
````
	cmwin.exe <source> <build_path> <architecture>

	<source> = dir to CMakeLists.txt
	ex. C:\Users\me\myProject
	default: current dir

	<build_path> = path where solution gets generated and build starts off
	default: build\

	<architecture> = target platform architecture
	default: x64
````

If you would like to use the uncompiled batch itself, it only works with CMakeLists.txt in same directory OR correct startparameters!

The release binary is a bit more comfortable and asks you for the file if CMakeLists.txt is not found.

Currently *only supported* with *Visual Studio 15 2017*!
But with a bit of fiddle it is easy to adjust the Batchfile.
