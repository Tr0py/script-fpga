

# compile with svm enabled, parallel to acc
tapasco -v --parallel compose [arrayinit x 1] @ 100MHz --features 'SVM {enabled: true}' -p AU250 --effortLevel fastest | tee log-au250
