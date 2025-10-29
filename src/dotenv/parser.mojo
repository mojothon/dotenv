from os import getenv, setenv
from pathlib import Path, cwd
from collections import Dict, List


fn load_dotenv() raises -> None:
    """
    Load the .env file from the current working directory.
    """
    var cwd = cwd()
    var dotenv_path = cwd / ".env"
    if not dotenv_path.exists():
        return

    with open(String(dotenv_path), "r") as f:
        file = f.read()

    var lines = file.split("\n")
    for i in range(len(lines)):
        var line = lines[i]
        var stripped_line = line.strip()
        if not stripped_line.startswith("#") and len(stripped_line) > 0:
            var key_value = stripped_line.split("=", 1)  # 只分割第一个等号
            if len(key_value) >= 2:
                var key = "".join(key_value[0].strip())
                var value = StringSlice(key_value[1].strip())
                print("key::::::::::::::::::::::", key)
                print("value::::::::::::::::::::", value)
                # 移除引号（如果存在）
                if (value.startswith('"') and value.endswith('"')) or (value.startswith("'") and value.endswith("'")):
                    value_1 = value[1:-1].__str__()
                else:
                    value_1 = value.__str__()
                _ = setenv(key, value_1, True)


fn dotenv_dict() raises -> Dict[String, String]:
    """
    Return a dictionary of the key-value pairs in the .env file.
    """
    var cwd = cwd()
    var dotenv_path = cwd / ".env"
    var dict = Dict[String, String]()
    if not dotenv_path.exists():
        return dict^

    try:
        with open(String(dotenv_path), "r") as f:
            file = f.read()

        var lines = file.split("\n")
        for i in range(len(lines)):
            var line = lines[i]
            var stripped_line = line.strip()
            if not stripped_line.startswith("#") and len(stripped_line) > 0:
                var key_value = stripped_line.split("=", 1)  # 只分割第一个等号
                if len(key_value) >= 2:
                    var key = "".join(key_value[0].strip())
                    var value = StringSlice(key_value[1].strip())
                    # 移除引号（如果存在）
                    if (value.startswith('"') and value.endswith('"')) or (value.startswith("'") and value.endswith("'")):
                        value_1 = value[1:-1].__str__()
                    else:
                        value_1 = value.__str__()
                    dict[key] = value_1
    except:
        print("Error loading .env file")
    return dict^


fn dotenv_keys() raises -> List[String]:
    """
    Return a list of the keys in the .env file.
    """
    var keys = List[String]()
    var env_dict = dotenv_dict()
    for item in env_dict.items():
        keys.append(item.key)
    return keys^


fn dotenv_values() raises -> List[String]:
    """
    Return a list of the values in the .env file.
    """
    var values = List[String]()
    var env_dict = dotenv_dict()
    for item in env_dict.items():
        values.append(item.value)
    return values^


fn get_key(key_name: String, default: String = "") -> String:
    """
    Get the key from the .env file or environment variables.
    """
    return getenv(key_name, default)


fn set_key(key_name: String, value: String) -> Bool:
    """
    Set the key in environment variables.
    Returns True if successful, False otherwise.
    """
    return setenv(key_name, value, True)
