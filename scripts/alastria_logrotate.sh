#!/bin/bash
# crate a crontab job with the following
# m h  dom mon dow   command
#0 5 * * * ~/alastria-node/scripts/alastria_logrotate.sh > ~/alastria/logs/rotate.log
set -u 
set -e
CRON="0 5 * * * ~/alastria-node/scripts/alastria_logrotate.sh >> ~/alastria/logs/rotate.log 2>&1"
(crontab -l | grep . ; echo -e "$CRON\n") | crontab -

echo "rotating logs" 
logrotate ~/alastria-node/data/alastria_logrotate.conf --state ~/alastria/data/alastria_logrotate.state --verbose --force
echo "done."

set +u
set +e
