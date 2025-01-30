# Conduit G2 Mammothon
## Background
Thus far, dapps have been limited by throughput in terms of gas/sec.
Smart contract design is usually about trying to get the most minimal possible on-chain footprint as possible to decrease costs.
However, with Conduit G2 and Celestia, we can sustain 100Mgas/sec for a rollup without raising the base fee.
This means that we can verifiably store and compute much more data on-chain than we could before.
So what if instead of trying to minimize the on-chain footprint, we tried to maximize it?

## The Project
The million dollar home page was an early viral website where 1,000,000 pixels were sold for $1 each, netting the owner $1M in revenue.

With rollups we have something similar: a scarce resource (blockspace) that is being auctioned off to users.
The premise of this challenge is to take the idea of the million dollar home page and updated it using smart contracts.

### Use cases
- Decentralizing access to dapp UIs: anyone should be able to access dapps without having to deal with geoblocking or other forms of censorship. Serving UIs directly from the chain is a step in this direction.
- Making upgrades to the UI transparent: there was a case recently where [Polymarket updated their UI](https://polymarket.com/event/us-government-shutdown-before-2025) for a market on a possible future US government shutdown. By updating the UI, they resolved the market despite ambiguity, putting lots of power in the hands of unknown devs at Polymarket. Governing the UI on-chain would have made this more transparent. 

## The protocol
I defined a simple interface `IHtml.sol` that requires a GET and POST function.
We can deploy as many instances of this contract as we want, and each instance is universally identifiable by its address.
Furthermore, there is nothing stopping anyone from modifying `Html.sol` to include more complex logic. Some ideas include:
- a page governed by a multisig/DAO
- a page represented as an NFT that can be traded on a marketplace
- a page that requires you to burn a token to modify it
- a page where the "backend" is just the contract storage itself


For pages themselves to deploy, examples are provided such as
- an immutable page: [helloworld.html](./pages/helloworld.html)
- a page that uses the blockchain as a backend, displaying the current owner of the page: [readfromchain.html](./pages/readfromchain.html)

## Deploying `Html` pages to the chain
Templates are provided in `./scripts`.
```bash
forge script ./script/DeployHelloWorld.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
forge script ./script/DeployChainRead.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
```

Total gas used:
- deployment: `701_744`
- setting html: `1_523_345`
total: `2_225_089`

So assuming 100Mgas/sec we could do ~45 websites/sec. No backend, no cloud hosting hosts, just crypto.

## Building Further Upon this Project
- A "browser" that will fetch data from the chain instead of from DNS. This could be set up as a mirror where you have a normal website that proxies requests to the chain and calls `GET()` on the contract requested, and forwards it.
- A "trending" page that shows you a list of new sites created
- Extensions/modifications to the protocol [IHtml.sol](./src/IHtml.sol) - I've only implemented `GET` and `POST` - perhaps we want to modify these interfaces or add more HTTP methods.
- A dapp that makes it easy for anyone to deploy their own site onto this chain

## Other Ideas for Using G2
Literally anything that requires lots of compute and data is a good idea to build with G2. Any portion of a protocol currently being done off-chain is a good candidate to replace with an on-chain set of transparent smart contracts.

# Access to G2 Chain
All information can be found [here](https://hub.conduit.xyz/mammothon-g2-testnet-4a2w8v0xqy) including
- chain id
- rpc url
- explorer url
- bridge url