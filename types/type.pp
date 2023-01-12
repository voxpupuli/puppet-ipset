#
# @summary type to allow all different hash setups for ipsets
#
# @see http://ipset.netfilter.org/ipset.man.html#lbAW documentation for all different hash options
#
type IPSet::Type = Enum[
  'bitmap:ip',
  'bitmap:ip,mac',
  'bitmap:port',
  'hash:ip',
  'hash:mac',
  'hash:ip,mac',
  'hash:net',
  'hash:net,net',
  'hash:ip,port',
  'hash:net,port',
  'hash:ip,port,ip',
  'hash:ip,port,net',
  'hash:ip,mark',
  'hash:net,port,net',
  'hash:net,iface',
  'list:set',
]
