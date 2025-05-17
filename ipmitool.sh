#!/bin/bash
ipmitool -I lanplus -H IPADDR -U USERNAME -P 'PASSWORD' bmc reset cold
ipmitool -I lanplus -H IPADDR -U USERNAME -P 'PASSWORD' chassis status
