# pragma version ^0.4.0

# @pure - do not read any state and global variable
# @view - read state and globarl variables

contador: public(uint256)

@external 
@pure 
def add(x: uint256, y: uint256) -> uint256:
    return x + y 

@external 
@view 
def add_to_count(x: uint256) -> uint256:
    return x + self.contador + block.timestamp

