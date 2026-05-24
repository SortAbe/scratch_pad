#!/bin/awk -f

BEGIN {

  mask = 17;

  network_space = (32 - mask)
  mod_24_bit = (2**24);
  mod_16_bit = (2**16);
  mod_8_bit = (2**8);
}

{
  split($1, ip_arr_in, ".");
  ip_int = lshift(ip_arr_in[1], 24) + lshift(ip_arr_in[2], 16) + lshift(ip_arr_in[3], 8) + ip_arr_in[4];
  ip_int = lshift(rshift(ip_int, network_space), network_space);
  ip_arr_out[1] = rshift(ip_int, 24);
  ip_arr_out[2] = rshift(ip_int%mod_24_bit, 16);
  ip_arr_out[3] = rshift(ip_int%mod_16_bit, 8);
  ip_arr_out[4] = ip_int%mod_8_bit;
  print ip_arr_out[1]"."ip_arr_out[2]"."ip_arr_out[3]"."ip_arr_out[4]"/"mask;
}
