# Wavelet Releases

Official releases of the [Perlin][perlin] Wavelet ledger. For more info, read our [blog post][wavelet-ledger]. For more info see [Perlin.net][perlin].

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
| **`wavelet`** | The main Wavelet CLI client. It runs a testnet node (private network) and also allows for remote API access. Refer to the [Wavelet CLI][wiki-wavelet-cli] wiki page for command line options. |
| `wctl` | Utility tool to interact with a Wavelet client. Please see our [wctl][wiki-wctl] wiki page for details. |

# Getting Started

To get started running Wavelet, download one of the pre-built release binaries from our [GitHub releases][github-releases] page. We currently support Linux and OSX (x64 only). Binaries for Windows are included but not fully supported.

## Quickstart

To test Wavelet on a local cluster, run the following commands in 2 terminals.

```shell
[terminal 1] > ./wavelet --port 3000 --db.path testdb_1 --api.port 9000
[terminal 2] > ./wavelet --port 3001 --db.path testdb_2 \
    --private_key_file wallet.txt \
    --peers tcp://localhost:3000
```

To send a transaction, type the following command into terminal 1: `p [public_key] 5` replacing `[public_key]` with the second client's generated public key. This sends 5 PERLs (Perlin tokens) to the second client.

```shell
> Enter a message: p bfba6b298c9ff9beb1848d8dbd0fa4ceb2967dce3913eeaa91376fb1db27c284 5
2018-11-07T14:00:48-05:00 |INFO| Success! Your payment transaction ID: 478ad5e199db74ebcde14c90b24fe74cbdc9521c9625f5b2ac4f6f304cd8cb88
```

In terminal 2, you can check the balance with the following command.

```shell
> Enter a message: w
2018-11-07T14:01:41-05:00 |INFO| Here is your wallet information. balance: 5 id: bfba6b298c9ff9beb1848d8dbd0fa4ceb2967dce3913eeaa91376fb1db27c284 nonce: 9 stake: 0
```


## Running Wavelet

Starting Wavelet with no arguments will launch the client with the default settings listening for connections on port 3000. It saves ledger state data to directory `testdb`.

```shell
❯ ./wavelet
2018-11-07T14:03:09-05:00 |INFO| Database has been loaded. db_path: testdb
2018-11-07T14:03:09-05:00 |INFO| Successfully seeded the genesis of this node. file: genesis.json num_accounts: 1
2018-11-07T14:03:09-05:00 |INFO| Registered transaction processor service. module: cloud.wasm
2018-11-07T14:03:09-05:00 |INFO| Registered transaction processor service. module: contract.wasm
2018-11-07T14:03:09-05:00 |INFO| Registered transaction processor service. module: money.wasm
2018-11-07T14:03:09-05:00 |INFO| Registered transaction processor service. module: stake.wasm
2018-11-07T14:03:09-05:00 |INFO| Keypair loaded. private_key: 6d6fe0c2bc913c0e3e497a0328841cf4979f932e01d2030ad21e649fca8d47fe71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858 public_key: 71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858
2018-11-07T14:03:09-05:00 |INFO| Listening for peers. address=tcp://127.0.0.1:3000
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

* `w [public_key]`: View details about a wallet. If public_key is not specified, it retrieves the client's wallet information.
* `p [public_key] [amount]`: Pay amount to a wallet given its public key.
* `tx [tx_id]`: Returns details about transaction with tx_id.
* `c [smart_contract_path]`: Deploy a smart contract at specified path.
* `ps [stake_amount]`: Register as a validator with a placed stake amount.
* `ws [stake_amount]`: Withdraw stake amount from your stake as a validator.

### Programatically using wctl

With the `wctl` application, you can send remote API commands to a Wavelet client if the API option is enabled. Refer to the [wctl wiki page][wiki-wctl] for usage instructions.

```shell
> ./wctl send_transaction --remote ${API_HOST}:${API_PORT} \
    --privkey ${API_KEY} \
    transfer '{"recipient": "${PUBLIC_KEY}", "amount": ${AMOUNT}}'
```

### Web UI

To interact with your wavelet node through the browser, see the [Lens](https://github.com/perlin-network/lens) project.

[perlin]: https://www.perlin.net
[wavelet-ledger]: https://medium.com/perlin-network/wavelet-a-metastable-sybil-resistant-ledger-517ea7ee9031
[discord-shield]: https://img.shields.io/discord/458332417909063682.svg
[discord]: https://discord.gg/dMYfDPM
[github-releases]: https://github.com/perlin-network/wavelet-bin/releases
[wiki-wavelet-cli]: https://github.com/perlin-network/wavelet-bin/wiki/Command-Line-Options
[wiki-wctl]: https://github.com/perlin-network/wavelet-bin/wiki/wctl
[wiki-wavelet-configuration-file]: https://github.com/perlin-network/wavelet-bin/wiki/Configuration-File
