# pragma version ^0.4.0
# @license MIT

my_favorite_number: public(uint256) # '7'
listOfNumbers: public(uint256[5]) 

# Constructor
@deploy
def __init__():
    self.my_favorite_number = 7

@external 
def store(new_number: uint256):
    self.my_favorite_number = new_number

# if we add in a functino extra data, the execution cost will increase
# in terms of gas

@external 
@view 
def retrieve() -> uint256:
    return self.my_favorite_number

@external 
def add_number(favorite_number: uint256): # al ser una funcion con parámetros, en el deploy ya nos pide que guardemos los parametros
    self.listOfNumbers[0] = favorite_number #Usamos el self como para acceder a data de fuera de la función (creo)