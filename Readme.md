# Local Bitcoin Node with Electrs and Mempool.space

This repo sets up a Bitcoin Core node with Electrs and Mempool.space (frontend & backend) using Docker.

## Services

- **Bitcoin Core**: Full Bitcoin node in regtest mode.
- **Electrs**: Electrum server for lightweight wallet services.
- **Mempool.space**: Local instance of Mempool frontend and backend.
- **MariaDB**: Backend database for Mempool API.

## StartUp

`docker compose up -d --build --force-recreate`

## Access to services

- Bitcoin Node P2P Network: `localhost:8333`
- Bitcoin Node RPC Interface: `localhost:8332`
- Electrs (Electrum Server): `localhost:50001`
- Mempool.space Frontend: `localhost:80`
