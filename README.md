# Wavelet Releases

Official releases of the [Perlin](perlin) Wavelet ledger. For more info, read our [blog post](wavelet-ledger).

[![Discord](https://img.shields.io/badge/discord-join%20chat-blue.svg)](discord)

Binary archives are published at [GitHub releases](github-releases).

# Table of Contents
- [Executables](#executables)
- [Getting Started](#getting-started)
    * [Running Wavelet](#running-wavelet)
- [Configuring](#configuring)

# Executables

The Perlin Wavelet project comes with several wrappers/executables.

| Command    | Description |
|:----------:|-------------|
| **`wavelet`** | The main Wavelet CLI client. It allows running a testnet node (private network), and used by other processes to access the network. Refer to the [Wavelet CLI wiki page](wiki-wavelet-cli) for command line options. |
| `wctl` | Utility tool to interact with a Wavelet client. Please see our [wctl](wctl-wiki) wiki page for details. |

# Getting Started

To get started running Wavelet, download one of the pre-built release binaries from our [GitHub releases page](github-releases). We currently support Linux and OSX (x64 only). Support for Windows coming soon.

## Running Wavelet

To test Wavelet on a local cluster, you can run the following commands in 3 terminals:

```
[terminal 1] $ ./wavelet --port 3000 --db.path testdb_1 --api.port 9000
[terminal 2] $ ./wavelet --port 3001 --db.path testdb_2 --privkey random --peers tcp://localhost:3000
[terminal 3] $ ./wavelet --port 3002 --db.path testdb_3 --privkey random --peers tcp://localhost:3000
```

The first command will start up a Wavelet client listening for connections on port 3000. It saves ledger state data to directory `testdb_1` and also accepts API commands from `wctl` on port 9000.

To send a transaction, type one of the following in the terminal of a node:

```
[terminal 1] > Enter a message:
 # `w`: to view your wallet
 # `p {public key} {amount}`: to pay a random wallet
 # `a {public key}`: to view the balance of another account
 # ctrl-c: to exit
```

### Configuration

As an alternative to passing the numerous flags to the `wavelet` binary, you can also pass a configuration file via:

```
$ ./wavelet --config /path/to/your_config.toml
```

##  Alternative ways to interact with wavelet nodes

### Programatically

To send a transaction through commandline, you can use the `wctl` application:

```
[terminal 4] $ ./wctl send_transaction --remote localhost:9000 --privkey 6d6fe0c2bc913c0e3e497a0328841cf4979f932e01d2030ad21e649fca8d47fe71e6c9b83a7ef02bae6764991eefe53360a0a09be53887b2d3900d02c00a3858 transfer '{"recipient": "8f9b4ae0364280e6a0b988c149f65d1badaeefed2db582266494dd79aa7c821a", "amount": 10}'
```

### Web UI

Coming soon...

[perlin]: https://www.perlin.net
[wavelet-ledger]: https://medium.com/perlin-network/wavelet-a-metastable-sybil-resistant-ledger-517ea7ee9031
[discord]: https://discord.gg/dMYfDPM
[github-releases]: https://github.com/perlin-network/wavelet-bin/releases
[wiki-wavelet-cli]: https://github.com/perlin-network/wavelet-bin/wiki/Command-Line-Options
[wiki-wctl]: https://github.com/perlin-network/wavelet-bin/wiki/wctl