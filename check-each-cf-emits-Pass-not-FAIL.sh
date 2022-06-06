FAILURES=0
for each in $(ls | grep "\.cf$"); do
  echo "Running $each"
  output=$(cf-agent -Kf $each)
  if [ "echo $output | grep Pass" ] && [ "echo $output | grep -v FAILED" ]; then
    echo "Passed $each"
  else
    FAILURES=$((FAILURES+1))
    echo "FAILED $each"
    echo "cf-agent -Kf $each:"
    echo "$output"
  fi
done
if [ $FAILURES -eq 0 ]; then
  # Non zero failures, fail
  exit 1
else
  # No Failures
  exit 0
fi
