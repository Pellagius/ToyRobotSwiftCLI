# ToyRobotSwiftCLI

A light weight app for a light weight task!

RobotTestSwiftCLI is a excutable swift package that also contains a library dependency and a test target. Everything is run from the command line however there are some environment requirements:

1. You will need a swift compiler and this will come with Xcode, so Xcode is a requirement and mac to install it on!
2. The apps test target contains a test suite written with swifts new Testing library - this will mean you will need to have swift 5.9+ configured and enabled

Running RobotTestSwiftCLI

1. Please download the zip and pull out the the Swift package to a nominated directory. In Terminal, please navigate to that directory and navigate into /RobotTestSwiftCLI
2. Run 'swift build' and observe the build compiler successfully build the package.
3. Once complete, run 'swift run' and this will run the executable target
4. To quit the app at any time, hit Ctrl-Z. Rerun again from step 3 to test again

Running the Test Target
1. Quite simple: from the same directory that we were building and runnning above, please run 'swift test' and you will observer the test suite execute and the test results output in the command line.

Final Note
I have taken the liberty of making the ToyRobot a but talkative/responsive, the spec mentions what the output should be, i hope making the output for each set of commands, failed input etc a little but explanatory is not considered going too heavily against the specification. Apart from the that, everything is as the spec would like it.
