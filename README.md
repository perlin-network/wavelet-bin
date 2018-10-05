# Wavelet Releases

Official releases of the [Perlin][perlin] Wavelet ledger. For more info, read our [blog post][wavelet-ledger].

[![Discord][discord-shield]][discord]

Binary archives are published at [GitHub releases][github-releases].

# Table of Contents
- [Wavelet Releases](#wavelet-releases)
- [Table of Contents](#table-of-contents)
- [Executables](#executables)
- [Getting Started](#getting-started)
    - [Quickstart](#quickstart)
    - [Running Wavelet](#running-wavelet)
    - [Configuration file](#configuration-file)
    - [Interacting with Wavelet](#interacting-with-wavelet)
        - [Directly through the client](#directly-through-the-client)
        - [Programatically using wctl](#programatically-using-wctl)
        - [Web UI](#web-ui)

# Executables

The Perlin Wavelet project comes with several wrappers/executables.

| Command    | Description |
|:----------:|-------------|
| **`wavelet`** | The main Wavelet CLI client. It allows running a testnet node (private network), and used by other processes to access the network. Refer to the [Wavelet CLI][wiki-wavelet-cli] wiki page for command line options. |
| `wctl` | Utility tool to interact with a Wavelet client. Please see our [wctl][wiki-wctl] wiki page for details. |

# Getting Started

To get started running Wavelet, download one of the pre-built release binaries from our [GitHub releases][github-releases] page. We currently support Linux and OSX (x64 only). Support for Windows coming soon.

## Quickstart

To test Wavelet on a local cluster, run the following commands in 2 terminals.

```shell
[terminal 1] > ./wavelet --port 3000 --db.path testdb_1 --api.port 9000
[terminal 2] > ./wavelet --port 3001 --db.path testdb_2 \
    --privkey 25eef1345af9a2ce93e7ca5623224913b64b71ac314480902c1ec3bdba8b7537e6bb44e8ae761d9793f6941929dbf81f5727b698945746e5f3233b0ee0e83be7 \
    --peers tcp://localhost:3000
```

To send a transaction, type the following command into terminal 1: `p e6bb44e8ae761d9793f6941929dbf81f5727b698945746e5f3233b0ee0e83be7 5`. This sends 5 PERLs (Perlin tokens) to the second client.

```shell
> Enter a message: p e6bb44e8ae761d9793f6941929dbf81f5727b698945746e5f3233b0ee0e83be7 5
2018-10-05T11:44:49-04:00 |DEBUG| Applied transaction. nonce=2 public_key=e6bb44e8ae761d9793f6941929dbf81f5727b698945746e5f3233b0ee0e83be7 tx=7c3628c1b13ac18c52c3f3f9b84000116507056a7e8f63cba0c26eb42393c86d
2018-10-05T11:44:49-04:00 |DEBUG| Accepted 1 transactions. accepted=["7c3628c1b1"]
2018-10-05T11:44:49-04:00 |DEBUG| Received an existing transaction, and voted 'true' for it. id=40cfa6eb4e360c67c390791fe19f69f611d705efb10d764f6592b45640abbcf6 tag=nop

...

2018-10-05T11:44:50-04:00 |DEBUG| Accepted 1 transactions. accepted=["40cfa6eb4e"]
2018-10-05T11:44:50-04:00 |DEBUG| Received an existing transaction, and voted 'true' for it. id=bb2b0bd545a06b46845a6ec760b5ea61b2714164762ac123801cb149fe9fc87c tag=nop
2018-10-05T11:44:50-04:00 |DEBUG| Successfully broadcasted transaction. id=40cfa6eb4e360c67c390791fe19f69f611d705efb10d764f6592b45640abbcf6 tag=nop
```

## Running Wavelet

Starting Wavelet with no arguments will launch the client with the default settings listening for connections on port 3000. It saves ledger state data to directory `testdb`.

```shell
> ./wavelet
2018-10-05T11:10:02-04:00 |INFO| Database has been loaded. db_path=testdb
2018-10-05T11:10:02-04:00 |INFO| Successfully seeded the genesis of this node. file=genesis.json num_accounts=1
2018-10-05T11:10:02-04:00 |INFO| Registered transaction processor service. module=cloud.wasm
2018-10-05T11:10:02-04:00 |INFO| Registered transaction processor service. module=contract.wasm
2018-10-05T11:10:02-04:00 |INFO| Registered transaction processor service. module=money.wasm
2018-10-05T11:10:02-04:00 |INFO| Keypair loaded. private_key=6d6fe0c2bc913c0e3e497a0328841cf4979f932e01d2030ad21e649fca8d47fe71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858 public_key=71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858
ERROR: logging before flag.Parse: I1005 11:10:02.659623   16931 network.go:206] Listening for peers on tcp://127.0.0.1:3000.
Enter a message: w
2018-10-05T11:10:05-04:00 |INFO| Here is your wallet information. balance=100000000 id=71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858 nonce=0
Enter a message:
```


## Configuration file

As an alternative to passing the flags to the `wavelet` binary, you can also pass a configuration file. For all configuration options, refer to the [Configuration file][wiki-wavelet-configuration-file] section of the wiki.

```shell
> ./wavelet --config /path/to/your_config.toml
```

## Interacting with Wavelet

You can interact with Wavelet in several ways.

### Directly through the client

In the Wavelet command line mode, you can directly enter commands through the console. The following is a list of supported commands.

```shell
`w`: to view your wallet
`p <public key> <amount>`: to pay a wallet with the specified public key
`a <public key>`: to view the balance of another account
```

### Programatically using wctl

With the `wctl` application, you can send remote API commands to a Wavelet client if the API option is enabled. Refer to the [wctl wiki page][wiki-wctl] for usage instructions.

```shell
> ./wctl send_transaction --remote ${API_HOST}:${API_PORT} \
    --privkey ${API_KEY} \
    transfer '{"recipient": "${PUBLIC_KEY}", "amount": ${AMOUNT}}'
```

### Web UI

Coming soon...

[perlin]: https://www.perlin.net
[wavelet-ledger]: https://medium.com/perlin-network/wavelet-a-metastable-sybil-resistant-ledger-517ea7ee9031
[discord-shield]: https://img.shields.io/discord/458332417909063682.svg
[discord]: https://discord.gg/dMYfDPM
[github-releases]: https://github.com/perlin-network/wavelet-bin/releases
[wiki-wavelet-cli]: https://github.com/perlin-network/wavelet-bin/wiki/Command-Line-Options
[wiki-wctl]: https://github.com/perlin-network/wavelet-bin/wiki/wctl
[wiki-wavelet-configuration-file]: https://github.com/perlin-network/wavelet-bin/wiki/Configuration-File