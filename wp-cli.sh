#!/bin/bash

wp plugin list --status=active --allow-root

wp profile stage --skip-plugins=$(wp plugin list --status=active --allow-root | awk 'NR>31&&NR<33{printf "%s,", $1}') --allow-root
