for each in $(ls | grep "\.cf$"); do
  output=$(cf-agent -Kf $each)
  if [ "echo $output | grep Pass" ] && [ "echo $output | grep -v FAILED" ]; then
    exit 0
  else
    exit 1
  fi
done
