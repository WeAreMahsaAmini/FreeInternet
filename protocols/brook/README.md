# Setting up a brook wsserver and a domestic server as a relay

This tutorial is primarily for debian-based linux distributions, like Ubuntu, however, it might still work on other distributions.

[Brook](https://github.com/txthinking/brook) is probably the easiest and the fastest method to get to free internet.

To proceed with this tutorial, you need to have two servers available, one within Iran (or your own country) and one outside of the country.

The domestic server will act as a relay to the brook wsserver. **Make sure the servers can reach each other.**

## Step 1: Installing brook on both servers

To install brook in a single line command, run the following:

```bash
bash <(curl https://bash.ooo/brook.sh)
```

once `nami` is installed, run:

```bash
nami install brook
```

you could check if brook is installed successfully by:

```bash
brook --version
```

If your domestic server is unable to reach GitHub, [you may need to ssh tunnel into your foreign server and then rerun the command](#1-domestic-server-unable-to-reach-github-or-docker).



## Step 2: Brook wsserver (run foreign server)

You could run a wsserver easily, like the following:

```bash
brook wsserver -l [wss_port] -p [wss_password] 
```

Where

- **wss_port** is any available port you may want to use for this

- **wss_password** any password you may want to use for authentication

Note that the password will be used on the client to connect to the domestic server.

The easiest way to manage your brook server(s) is to have it run in the background. You could either containerize with Docker, you could use tmux or you could use [joker](#2-daemonize-brook-with-joker)

## Step 3: Brook relay server (run domestic server)

Running the relay server is also a oneliner:

```bash
brook relayoverbrook -s ws://[foreign_ip]:[wss_port] -p [wss_password] -f :[relay_port] -t [foreign_ip]:[wss_port]
```

Where

- **relay_port** is the port you will be using on the client

## Troubleshooting

### **1. Domestic server unable to reach GitHub or Docker?**

That's a common issue, the following methods however only work if your foreign server has no issue reaching either service.

To fix this, run the following command on your domestic server:

```bash
ssh -D 9090 [user]@[foreign_server_ip]
```

You could use any available ports.

**Keep that ssh connection open** and launch another terminal to ssh into the domestic server again and then run:

```bash
export ALL_PROXY=socks://localhost:9090
```

Now this session of your ssh is using the ssh tunnel you just created.

### **2. Daemonize brook with joker**

**NOTE:** this requires you to have installed nami successfully during [brook installation](#installing-brook-on-both-servers)

To install [joker](https://github.com/txthinking/joker) run the following:

```bash
nami install joker
```

Now run every brook command like:

```bash
joker brook ...
```

You may use the following command to see the list of running daemons and log or stop a daemon:

```bash
joker list
joker log [id]
joker stop [id]
```

---

[Client connection](../../guides/brook/README.md)