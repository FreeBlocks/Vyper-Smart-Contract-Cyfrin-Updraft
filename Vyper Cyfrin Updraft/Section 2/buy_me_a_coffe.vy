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

#constructor
@deploy
def __init__():
    self.minimum_usd = 5


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
def _get_eth_to_usd_rate():
    # address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    # ABI: ??
    pass

@external 
def get_price():
    priced_feed: AggregatorV3Interface= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
    return price_feed.latestAnswer()