for each in $(ls | grep "\.cf"); do
  output=$(cf-agent -Kf $each)
  if [ echo $output | grep Pass ] && [ echo $outptu | grep -v FAILED ]; then
    exit 0
  fi
  else
    exit 1
  fi
done
