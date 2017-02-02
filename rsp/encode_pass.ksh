#!/usr/bin/sh

set -o noclobber

PASSWORD=$1

[ -z "$PASSWORD" -o -z "$2" ] && exit `echo "Usage: encode_pass.ksh <password> [BASE|ND]" >&2; echo 1`

function encode {
typeset FILE=$1

cat $FILE >$FILE.$$ 2>/dev/null
RC=$?
[ $RC -ne 0 ] && exit `echo "$FILE.$$ already existed" >&2; echo 1`

ex +"%s/com\.ibm\.SOAP\.securityEnabled=false/com.ibm.SOAP.securityEnabled=true/" +"%s/com\.ibm\.SOAP\.loginUserid=$/com.ibm.SOAP.loginUserid=WAS_User/" +"%s/com\.ibm\.SOAP\.loginPassword=$/ com.ibm.SOAP.loginPassword=$PASSWORD/" +"wq" $FILE

WAS_ProfilePath/bin/PropFilePasswordEncoder.sh $FILE com.ibm.SOAP.loginPassword

}


if test "$2" = "BASE"; then
  encode WAS_ProfilePath/properties/soap.client.props
elif test "$2" = "ND"; then
  encode WASND_ProfilePath/properties/soap.client.props
else
  exit `echo "Usage: encode_pass.ksh <password> [BASE|ND]" >&2; echo 1`
fi

