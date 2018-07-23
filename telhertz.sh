#!/bin/bash
type telnet 1>/dev/null 2>&1
ERRO="$?"

if [ "${ERRO}" -gt 0 ]
then
   echo -e "\nTelnet not installed or not in \$PATH\n" ; exit 3
fi

if [ -z $1 ] || [ -z $2 ]
then
   echo -e "\nSintaxe: $0 [ HOSTNAME/IP | -p 'port1 | port2 | ...' ]\n" ; exit 3
else
   HOST="$1"
   PORTS="$2"
fi

check_port_telnet()
{
TIMEOUT=3; telnet ${HOST} ${PORT} 2>&1 1>/dev/null & WPID=$!; sleep $TIMEOUT && kill $! 2>/dev/null 1>&1 & KPID=$!; wait $WPID 2>/dev/null
}

echo -e "telnet ${HOST} : | \c"

echo -e "`echo ${PORTS} | sed 's:|:\\n:g'`" | while read PORT
do
   check_port_telnet ${HOST} ${PORT}> /tmp/a.$$
   conf="`cat /tmp/a.$$ | grep -i closed | wc -l`" ; conf="`echo ${conf}`" ; yes | rm -f /tmp/a.$$ 2>/dev/null

   if [ "${conf}" -gt 0 ]
   then
      status="(${PORT}) | \c"
   else
      status="`tput smso`(${PORT})`tput rmso` | \c"
   fi
    echo -e "$status"
done
echo ""