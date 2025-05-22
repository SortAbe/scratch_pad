#!/bin/bash


first_params="
%{speed_download}<>\
%{time_namelookup}<>\
%{time_connect}<>\
%{time_appconnect}<>\
%{time_pretransfer}<>\
%{time_starttransfer}<>\
%{time_total}<>\
%{time_redirect}<>\
%{size_download}<>\
%{size_header}<>\
%{size_request}<>\
%{size_upload}<>\
%{url_effective}<>\
%{method}<>\
%{scheme}<>\
%{http_version}<>\
%{response_code}<>\
%{num_redirects}<>\
%{num_connects}<>\
%{remote_ip}<>\
%{ssl_verify_result}<>\
%{errormsg}
"

second_params="
%{speed_download}<>\
%{time_namelookup}<>\
%{time_connect}<>\
%{time_appconnect}<>\
%{time_pretransfer}<>\
%{time_starttransfer}<>\
%{time_total}<>\
%{time_redirect}"

for ((i = 0; i < 10; i++)); do

    if [[ $i -eq 0 ]]; then
        #first request includes all parameters, not necessary after first request
        output=$(curl -Lw "$first_params" -o /dev/null -s "$1");
        exit_code="$?";
    else
        output=$(curl -Lw "$second_params" -o /dev/null -s "$1");
        exit_code="$?";
    fi

    #clean up
    output="$(echo "$output" | sed '/^[[:space:]]*$/d' | tr --delete '\n')";

    #field 25 is error message
    if [[ $exit_code -gt 0 ]]; then
        echo "$output" | awk -F"<>" '{print $22}' 1>&2;
        exit 1;
    fi

    #whois
    ip=$(echo "$output" | awk -F"<>" '{print $20}');
    asn_info=$(curl -s "https://test.gitlo.net/whois.php" -d "$ip");
    asn_info=$(echo "$asn_info" | sed '/^ip:.*/d;s/^\w*: /<>/g' | tr --delete '\n');

    output="$output$asn_info";
    echo "$output";
done | awk -F"<>" '
BEGIN{
    ns=0;
    tcp_c=0;
    tls_c=0;
    fb=0;
    speed=0;
    total=0;
}
NR==1{
    size_download=$9;
    final_url=$13;
    method=$14;
    if ("HTTPS" == $15){
        scheme=" +SSL";
    } else {
        scheme="";
    }
    http_version=$16;
    status_code=$17;
    redirect=$18;
    connections=$19;
    ip=$20;
    if (0 == $21){
        ssl_result="Good";
    } else {
        ssl_result="Bad";
    }
    org=$23;
    country=$24;
    asn=$25;
    range=$26;
}
{
    speed+=$1;
    ns+=$2;
    tcp_c+=$3;
    tls_c+=$4;
    pre+=$6;
    fb+=$6;
    total+=$7;
    redir_w+=$8;

}
END{
    printf "Final URL:             %s\n", final_url;
    printf "Method:                %s\n", method;
    printf "Status Code:           %s\n", status_code;
    printf "Scheme:                HTTP/%s%s\n", http_version, scheme;
    printf "SSL Verify:            %s\n", ssl_result;
    printf "IP address:            %s\n", ip;
    printf "Country:               %s\n", country;
    printf "Organization:          %s\n", org;
    printf "ASN:                   %s\n", asn;
    printf "Range:                 %s\n", range;
    printf "\n"
    printf "Transfer Size:         %.0f KB\n", size_download/1024;
    printf "Transfer Speed         %.0f KB/s\n", (speed/NR)/1024;
    printf "Number of Redirects:   %s\n", redirect;
    printf "\n"
    printf "DNS Lookup:            %.0f ms\n", ns/NR*1000;
    printf "TCP Handshake Window:  %.0f ms\n", (tcp_c-ns)/NR*1000;
    printf "Redirect Window:       %.0f ms\n", redir_w/NR*1000;
    printf "TLS Handshake Window:  %.0f ms\n", (tls_c - tcp_c)/NR*1000;
    printf "Wait on Server:        %.0f ms\n", (pre - tls_c)/NR*1000;
    printf "First Byte:            %.0f ms\n", fb/NR*1000;
    printf "Transfer Window:       %.0f ms\n", (total - fb)/NR*1000;
    printf "Last Byte:             %.0f ms\n", total/NR*1000;
}
'


