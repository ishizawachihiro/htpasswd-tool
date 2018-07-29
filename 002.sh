#!/bin/bash
 
for fullname in `cat ./userpasslist.txt` ; do
  user=`expr $fullname : '\(.*:\)'`
  user=`echo $user | sed 's/://'`
  pass=`expr $fullname : '.*:\(.*\)'`
 
  expect -c "
    spawn htpasswd -d ./passwd.list $user
    expect \"New password: \" ; send \""$pass"\r\"
    sleep 1
    expect \"Re-type new password: \" ; send \""$pass"\r\"
    expect eof
  " >> ./passwd.log
done