#!/bin/sh
# display BTC and ETH exchange rates
wget -qO- https://api.kraken.com/0/public/Ticker?pair=ETHUSD,XBTUSD | jq \"Ξ\"+".result.XETHZUSD.c[0] + \" ₿\" + .result.XXBTZUSD.c[0]" | sed -e 's/\.[0-9]*//g' | tr -d '"'
