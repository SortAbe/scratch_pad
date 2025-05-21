#!/bin/bash
curl -Lw @- -o /dev/null -s "$1" <<EOF
num_redirects: %{num_redirects}\n
url_effective: %{url_effective}\n
http_version: %{http_version}\n
size_download: %{size_download}\n
speed_download: %{speed_download}\n
time_namelookup: %{time_namelookup}\n
time_connect: %{time_connect}\n
time_appconnect: %{time_appconnect}\n
time_starttransfer: %{time_starttransfer}\n
time_total: %{time_total}\n
content_type: %{content_type}\n
errormsg: %{errormsg}\n
http_code: %{http_code}\n
http_connect: %{http_connect}\n
http_version: %{http_version}\n
method: %{method}\n
num_connects: %{num_connects}\n
remote_ip: %{remote_ip}\n
response_code: %{response_code}\n
scheme: %{scheme}\n
size_download: %{size_download}\n
size_header: %{size_header}\n
size_request: %{size_request}\n
size_upload: %{size_upload}\n
speed_download: %{speed_download}\n
ssl_verify_result: %{ssl_verify_result}\n
time_appconnect: %{time_appconnect}\n
time_connect: %{time_connect}\n
time_namelookup: %{time_namelookup}\n
time_pretransfer: %{time_pretransfer}\n
time_redirect: %{time_redirect}\n
time_starttransfer: %{time_starttransfer}\n
time_total: %{time_total}\n
url: %{url}\n
EOF
