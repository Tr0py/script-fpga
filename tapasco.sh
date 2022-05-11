

# compile with svm enabled, parallel to acc
tapasco -v --parallel compose [arrayinit x 1] @ 100MHz --features 'SVM {enabled: true}' -p AU250 --effortLevel fastest | tee log-au250
# tapasco -v --parallel compose [myarr x 1] @ 100MHz --features 'SVM {enabled: true}' -p AU250 --effortLevel optimal | tee log-au250-myarr-svm


# CUSTOMIZE APPLICATIONS
# compile hls kernel
tapasco -v hls myarr -p AU250 --features 'SVM {enabled: true}'
#
