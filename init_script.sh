#!/bin/bash

echo ". torsocks on" >> ~/.bashrc

exec supervisord -c /etc/supervisor/supervisord.conf