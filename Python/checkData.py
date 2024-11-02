import json

def GetAllPokemonData()->list:
    """
    Get all pokemon data from JSON file
    
    Returns:
    pokemonData -- list of pokemon data
    """
    with open(r'C:/Users/evand/OneDrive - Université de Bourgogne/Verification Pokemon Robot/Data/pokemon.json', 'r', encoding='utf-8') as file:
        return json.load(file)


def GetSpecificPokemon(id:int, allPokemons:list)->dict:
    """
    Get specific pokemon data from JSON file

    Parameters:
    id -- id of pokemon
    allPokemons -- list of all pokemon data
    
    Returns:
    pokemonData -- dictionary of pokemon data
    """
    return allPokemons[id]

def VerifyID(id:int, pokemon:dict)->bool:
    """
    Verify if the id is valid

    Parameters:
    id -- id of pokemon
    
    Returns:
    bool -- True if id is valid, False otherwise
    """
    print(pokemon)
    return pokemon['pokedex_id'] == id

def VerifyGeneration(gen:int, pokemon:dict)->bool:
    """
    Verify if the generation is valid

    Parameters:
    gen -- generation of pokemon
    
    Returns:
    bool -- True if generation is valid, False otherwise
    """
    return pokemon['generation'] == gen

def VerifyCategory(cat:str, pokemon:dict)->bool:
    """
    Verify if the category is valid

    Parameters:
    cat -- category of pokemon
    
    Returns:
    bool -- True if category is valid, False otherwise
    """
    return pokemon['category'] == cat

def VerifyName(name:str, pokemon:dict)->bool:
    """
    Verify if the name is valid

    Parameters:
    name -- name of pokemon
    
    Returns:
    bool -- True if name is valid, False otherwise
    """
    return pokemon['name']['fr'] == name

def VerifyType(t:list, pokemon:dict)->bool:
    """
    Verify if the type is valid

    Parameters:
    t -- type of pokemon
    
    Returns:
    bool -- True if type(s) is valid, False otherwise
    """
    pass

def VerifyTalents(t:list, pokemon:dict)->bool:
    """
    Verify if the talents are valid

    Parameters:
    t -- talents of pokemon
    
    Returns:
    bool -- True if talents are valid, False otherwise
    """
    pass

def VerifyStats(s:dict, pokemon:dict)->bool:
    """
    Verify if the stats are valid

    Parameters:
    s -- stats of pokemon
    
    Returns:
    bool -- True if stats are valid, False otherwise
    """
    pass

def VerifyResistances(r:dict, pokemon:dict)->bool:
    """
    Verify if the resistances are valid

    Parameters:
    r -- resistances of pokemon
    
    Returns:
    bool -- True if resistances are valid, False otherwise
    """
    pass

def VerifyEvolution(e:dict, pokemon:dict)->bool:
    """
    Verify if the evolution is valid

    Parameters:
    e -- evolution of pokemon
    
    Returns:
    bool -- True if evolution(s) is valid, False otherwise
    """
    pass

def VerifyHeight(h:str, pokemon:dict)->bool:
    """
    Verify if the height is valid

    Parameters:
    h -- height of pokemon
    
    Returns:
    bool -- True if height is valid, False otherwise
    """
    return pokemon['height'] == h

def VerifyWeight(w:str, pokemon:dict)->bool:
    """
    Verify if the weight is valid

    Parameters:
    w -- weight of pokemon
    
    Returns:
    bool -- True if weight is valid, False otherwise
    """
    return pokemon['weight'] == w

def VerifyEggsGroup(eggs:list, pokemon:dict)->bool:
    """
    Verify if the eggs group is valid

    Parameters:
    eggs -- eggs group(s) of pokemon
    
    Returns:
    bool -- True if eggs group is valid, False otherwise
    """
    pass

def VerifyGenderRatio(g:dict, pokemon:dict)->bool:
    """
    Verify if the gender ratio is valid

    Parameters:


    Returns:
    """

def VerifyCatchRate(cr:int, pokemon:dict)->bool:
    """
    Verify if the catch rate is valid

    Parameters:
    cr -- catch rate of pokemon
    
    Returns:
    bool -- True if catch rate is valid, False otherwise
    """
    return pokemon['catch_rate'] == cr

def VerifyExpTo100(b:int, pokemon:dict)->bool:
    """
    Verify if the base experience is valid

    Parameters:
    b -- base experience of pokemon
    
    Returns:
    bool -- True if base experience is valid, False otherwise
    """
    return int(pokemon['level_100']) == int(b)