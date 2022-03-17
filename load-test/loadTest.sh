#!/bin/bash
echo "Load Test"
echo "kafka-broker & port:  $1"
echo "topic name: $2"
echo "quantity of events: $3"
echo "fileName: $4"
echo "header: $5"

start=$(date +%s)
numberOfMessagesToSent=$3

delimiterZero=0

for (( counter=0; counter<numberOfMessagesToSent; counter++ ))
do
      cat ./events/$4 | jq -c | kcat -b $1 -P -t $2 -H "__TypeId__=$5" &
      echo "Sent message number $counter"


done

end=$(date +%s)
elapsedTime=$(($end-$start))
echo "Elapsed Time: $elapsedTime seconds"

if [[ "$elapsedTime" == "$delimiterZero" ]] ; then
  echo "Too short execution time to determine KPI"
else
  kpi=$((numberOfMessagesToSent / elapsedTime))
  echo "Number of messages per second $kpi"
fi

echo "Execution is finished ..."