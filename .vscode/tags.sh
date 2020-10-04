git tag -l | while read t; do n=$(echo $t | sed "s/vv/v/g");  if [[ "$n" != "$t" ]]; then git tag $n $t; git tag -d $t ;fi;done
