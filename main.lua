posix=require'posix'
require 'instance'
instances={}
for i=1,5 do
  table.insert(instances,instance.create())
end
instances[1]:restore()
current.ap.ssid='ESPMESH'
current.ap.ip='10.10.0.1'
current.ap.netmask='255.255.255.0'
current.ap.channel=9
router.topology={6,3,2,1,1,1,1,1}
router.ssid=current.ap.ssid
router.state=router.CONFIGURED_FIXED
router.minip=0x0a0a0000
router.maxip=0x0a0af0ff
instances[1]:connect(instances[2],-60)
instances[1]:connect(instances[3],-70)
instances[1]:connect(instances[4],-80)
instances[4]:connect(instances[5],-65)
instances[1]:connect(instances[5],-85)

local x=5
while (x > 0) do
  if (instance.process_all_timers(instances)) then
    x=5
  end
  x=x-1
end
