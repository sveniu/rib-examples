#!/bin/sh

# Enable 'errexit' and 'nounset'.
set -e
set -u

# The policy-rc.d file was added in '24-C-apt_packages' to block service
# actions during package installs. Remove it here, to make service invocations
# work as expected.
rm -f /usr/sbin/policy-rc.d
