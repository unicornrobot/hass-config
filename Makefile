IP=			***REMOVED***.duckdns.org
USER=		root

put-config:
	scp -rp ./* ${USER}@${IP}:/config

get-config:
	scp -rp ${USER}@${IP}:/config/{*.yaml,**/*.yaml,*.conf} ./config

hass-logs:
	ssh ${USER}@${IP} "hassio homeassistant logs"

restart-hass:
	ssh ${USER}@${IP} "hassio homeassistant restart"

secrets:
	cp ./config/secrets.yaml.sample ./config/secrets.yaml


reset-nest:
	ssh ${USER}@${IP} "sudo rm /home/homeassistant/.homeassistant/nest.con"
