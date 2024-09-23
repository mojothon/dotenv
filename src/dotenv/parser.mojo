import os
import pathlib
from collections import Dict, List


fn load_dotenv() raises -> None:
    """
    Load the.env file from the current working directory.
    """
    var cwd = pathlib.cwd()
    var dotenv_path = cwd.joinpath(".env")
    if not dotenv_path.exists():
        return None

    var file: String = ""
    with open(dotenv_path, "r") as f:
        file = f.read()

    var lines = file.split("\n")
    for line in lines:
        var stripped_line = line[].strip()
        if not stripped_line.startswith("#") and stripped_line != "":
            var key_value = stripped_line.split("=")
            var key = key_value[0].strip()
            var value = key_value[1].strip()
            _ = os.setenv(key, value, overwrite=True)


fn dotenv_dict() raises -> Dict[String, String]:
    """
    Return a dictionary of the key-value pairs in the .env file.
    """
    var cwd = pathlib.cwd()
    var dotenv_path = cwd.joinpath(".env")
    var dict = Dict[String, String]()
    if not dotenv_path.exists():
        return dict

    try:
        var file: String = ""
        with open(dotenv_path, "r") as f:
            file = f.read()

        var lines = file.split("\n")
        for line in lines:
            var stripped_line = line[].strip()
            if not stripped_line.startswith("#") and stripped_line != "":
                var key_value = stripped_line.split("=")
                var key = key_value[0].strip()
                var value = key_value[1].strip()
                dict[key] = value
    except:
        print("Error loading .env file")
    return dict


fn dotenv_keys() raises -> List[String]:
    """
    Return a list of the keys in the .env file.
    """
    var keys = List[String]()
    for key in dotenv_dict().keys():
        keys.append(key[]) # use a a reference to get the string value.
    return keys


fn dotenv_values() raises -> List[String]:
    """
    Return a list of the values in the .env file.
    """
    var values = List[String]()
    for value in dotenv_dict().values():
        values.append(value[]) # use a a reference to get the string value.
    return values


fn get_key(key_name: String) raises -> String:
    """
    Get the key from the .env file.
    """
    var key = os.getenv(key_name)
    return key


fn set_key(key_name: String, value: String) raises -> String:
    """
    Set the key from the .env file.
    """
    _ = os.setenv(key_name, value, overwrite=True)
    return value

