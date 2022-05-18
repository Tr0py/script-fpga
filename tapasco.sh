
# compile svm
tapasco -v --parallel compose [arrayinit x 1, arraysum x 1, arrayupdate x 1] @ 100 MHz -p AU250 --features 'SVM {enabled: true}' | tee log-au250-svm-full

# compile with svm enabled, parallel to acc
tapasco -v --parallel compose [arrayinit x 1] @ 100MHz --features 'SVM {enabled: true}' -p AU250 --effortLevel fastest | tee log-au250
# tapasco -v --parallel compose [myarr x 1] @ 100MHz --features 'SVM {enabled: true}' -p AU250 --effortLevel optimal | tee log-au250-myarr-svm


# CUSTOMIZE APPLICATIONS
# compile hls kernel
tapasco -v hls myarr -p AU250 --features 'SVM {enabled: true}'
#


# Load the bitstream to FPGA, hotplug pci, and load driver
# Remember to unplug the Xilinx PCI FPGA first (using pci-remove-au250.sh). 
# tapasco-load-bitstream ./axi4mm-AU250--arraysum_1--200.0.bit --reload-driver --mode normal
tapasco-load-bitstream --reload-driver --mode normal <bitstream>
