.PHONY: start
start:
	@rm -rf bitcoin-data && rm -rf data && rm -rf mysql && rm -rf electrs-data/db && docker compose up -d --build --force-recreate && sleep 5 && curl --user regtest:regtest --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"createwallet","params":["go-wallet", false, false, "", false, true, true]}' -H 'content-type:text/plain;' http://127.0.0.1:8332 && curl --user regtest:regtest --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"importdescriptors","params": {"requests":[{"desc":"wpkh(cSaejkcWwU25jMweWEewRSsrVQq2FGTij1xjXv4x1XvxVRF1ZCr3)#ag7pgmdv","timestamp":"now"}]}}' -H 'content-type:text/plain;' http://127.0.0.1:8332

.PHONY: mine
mine:
	@curl --user regtest:regtest --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"generatetoaddress","params":[101, "bcrt1qwzgluflufpe43q5g6c0l8jxjfkyqjz00t65ak0"]}' -H 'content-type:text/plain;' http://127.0.0.1:8332

.PHONY: keep-mining
keep-mining:
	@watch -n $(SEC) "curl --user regtest:regtest --data-binary '{\"jsonrpc\":\"1.0\",\"id\":\"curltext\",\"method\":\"generatetoaddress\",\"params\":[1, \"bcrt1qwzgluflufpe43q5g6c0l8jxjfkyqjz00t65ak0\"]}' -H 'content-type:text/plain;' http://127.0.0.1:8332"