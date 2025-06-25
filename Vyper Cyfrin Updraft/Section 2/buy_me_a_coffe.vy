# Targets
# Get funds from users
# Withdraw funds
# Set a minimum funding value in USD

# pragma version 0.4.0
# @ license: MIT
# @ auther: Me
interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view

minimum_usd: uint256

price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 este contrato solo funciona en sepolia

#constructor
@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = 5
    self.price_feed = AggregatorV3Interface(price_feed_address)


@external 
@payable 
def fund():
    """"
    Allows user to send $ to this contract.
    Have a miniumum $ amount send

    1. How do we send  ETH to this contract?
    """
   
    assert msg.value >= self.minimum_usd, "You must spend more ETH"

@external 
def withdraw():
    pass

@internal 
def _get_eth_to_usd_rate(eth_amount: uint256):
# Chris sent us 0.01 for us to buy a coffe. Is that more or less than 5$
   price: int256 = staticcall self.price_feed.latestAnswer() #244045000000
   # 8 decimals
   # $3,021
   # eth_amount_to_usd
   eth_price: uint256 = convert(price, uint256) * (10 ** 10) #244045000000 -> 2440450000000000000000
    # ETH : 110000000000000000
    # $ / ETH: 2440450000000000000000
    # $
    eth_amount_in_usd: uint256 = (eth_amount * eth_price) // 1 * (10 ** 18)
    return eth_amount_in_usd

@external 
@view 
def get_price() -> int256:
    price_feed: AggregatorV3Interface= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return staticcall price_feed.latestAnswer()