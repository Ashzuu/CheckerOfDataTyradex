def ExtractHeight(height:str)->str:
    """
    Extract the height in Poképedia with the unit "m".

    Parameters:

    height -- string

    Returns:

    The good format for the height
    """
    return height.split(", ")[0]

def ExtractWeight(weight:str)->str:
    """
    Extract the height in Poképedia with the unit "kg".

    Parameters:

    weight -- string

    Returns:

    The good format for the weight
    """
    return weight.split(", ")[0]

def ExtractLevel100(level100:str)->str:
    """
    Extract the level100 field in Poképedia.

    Parameters:

    level100 -- string

    Returns:

    The good format for the explevel100
    """
    return (level100.split(" exp")[0].replace(" ", ""))
