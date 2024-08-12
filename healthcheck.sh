#!/usr/bin/env bash

# Test an HTTP site, return any error or http error
curl_test() {
    MSG=$1
    ERR=$2
    URL=$3
    echo -n ${MSG}
    http_code=`curl -o /dev/null -s -w "%{http_code}\n" ${URL}`
    ret=$?
    if [ "${ret}" != 0 ]; then
        echo " - ${ERR}, return code: ${ret}"
        return ${ret}
    else
        ## Accept both as valid
        if [ "${http_code}" != 200 ] && [ "${http_code}" != 401 ]; then
            echo " - ${ERR}, HTTP code: ${http_code}"
            return 1
        fi
    fi
    return 0
}

# Test Registry service running on 5000. If it returns 200 o Unauthorized (401) both valid
PORT=80
curl_test "Test nginx http" "Error testing supervisord :${PORT}" "http://${HOSTNAME}:${PORT}/v2/" || { ret=${?}; exit ${ret}; }
echo " Ok."

# All passed
exit 0
