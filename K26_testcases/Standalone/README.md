# Build tests

Set the environment for vitis 2022.1 tool.

Update the xsa path in the build tcl files. 

On a development server open bash prompt and run 

xsct buildAES128.tcl

xsct buildFFT.tcl

xsct buildFIR.tcl

# Run tests

Update the bit files, data and elf path for the required RM in the test.tcl. 

For running tests run following scripts in xsdb prompt on board.

source test.tcl