#!/bin/bash

export COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid |tr '[:upper:]' '[:lower:]')
export COMPUTE_INSTANCE_ID=$(replace this text with request instance id from metadata e.g. using curl)

echo 'This message was generated on instance $COMPUTE_INSTANCE_ID with the following UUID $COMPUTE_MACHINE_UUID'


