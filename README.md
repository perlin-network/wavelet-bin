## Wavelet

Official golang implementation of the Perlin Wavelet protocol. See perlin.net.

[![Discord](https://img.shields.io/badge/discord-join%20chat-blue.svg)](https://discord.gg/dMYfDPM)

Binary archives are published at https://github.com/perlin-network/wavelet-bin/releases.

## Executables

The Perlin Wavelet project comes with several wrappers/executables.

| Command    | Description |
|:----------:|-------------|
| **`wavelet`** | The main Perlin Wavelet CLI client, it allows running a testnet node (private network), and used by other processes to access the network. `wavelet --help` and the [CLI Wiki page](https://github.com/perlin-network/wavelet-bin/wiki/Command-Line-Options) for command line options. |
| `wctl` | Developer utility tool to support sending transactions into the Perlin Wavelet network. Please see our [wctl](https://github.com/perlin-network/wavelet-bin/wiki/wctl) wiki page for details. |

## Running wavelet

If you would like to test the perlin project on a local cluster, you can run the following commands in 3 terminals:

```
[terminal 1] $ ./wavelet --port 3000 --db.path testdb3000 --api.port 9000
[terminal 2] $ ./wavelet --port 3001 --db.path testdb3001 ----privkey random --peers tcp://localhost:3000
[terminal 3] $ ./wavelet --port 3002 --db.path testdb3002 ----privkey random --peers tcp://localhost:3000
```

*You need at least 3 processes active to have the ledger update.*

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
