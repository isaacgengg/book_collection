#!/usr/bin/env bash
set -euo pipefail
cd /csce431
bundle check || bundle install
bin/rails db:prepare
exec bin/rails s -b 0.0.0.0 -p 3000
~