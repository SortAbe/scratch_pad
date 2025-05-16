select
  32 - round(log (2, (end - start + 1))) as 'cidr',
  org,
  asn,
  ipv4_1_str,
  ipv4_2_str
from
  ipv4_data
where
  lower(org) like "%hivelocity%";

select
  org,
  asn,
  ipv4_1_str,
  ipv4_2_str,
  32 - round(log (2, (end - start + 1))) as 'cidr'
from
  ipv4_data
where
  lower(org) like "%hivelocity%"
  order by (end-start) desc
limit 30;

select
  oct_1,
  org,
  format((end - start), 'N', 'en-us') as 'size'
from
  ipv4_data
where
  oct_1 = 48
order by
  (end - start);

select
  country,
  format(sum(end - start), 'N', 'en-us') as 'sum'
from
  ipv4_data
where
  org not like ''
group by
  country
order by
  sum(end - start) desc
limit
  40;

select
  asn,
  format(sum(end - start), 'N', 'en-us') as 'sum'
from
  ipv4_data
where
  org not like ''
  and asn not like ''
group by
  asn
order by
  sum(end - start) desc
limit
  40;

select
  org,
  format(sum(end - start), 'N', 'en-us') as 'sum'
from
  ipv4_data
where
  org not like ''
group by
  org
order by
  sum(end - start) desc
limit
  40;

select
  org,
  format(sum(end - start), 'N', 'en-us') as 'sum'
from
  ipv4_data
where
  org not like ''
  and (lower(org) like '%host%' or lower(org) like '%cloud%' or lower(org) like '%rack%')
group by
  org
order by
  sum(end - start) DESC
  limit 10;

select
  country,
  format(sum((end - start) + 1), 'N', 'en-us')  as 'total'
from
  ipv4_data
where
  lower(org) like '%hivelocity%'
group by
  country
order by
  sum((end - start) + 1) desc;


select
  sum(end-start)
from
  ipv4_data
where
  lower(org) like "%hivelocity%";
