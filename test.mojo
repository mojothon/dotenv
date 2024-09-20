import os
from dotenv import load_dotenv, dotenv_dict, dotenv_keys, dotenv_values, get_key, set_key
from dotenv.version import __version__

fn main() raises:
    _ = load_dotenv()
    # 获取某个变量
    var key = os.getenv("KEY")
    print(key)

    var dict = dotenv_dict()
    print(dict.__str__())

    var keys = dotenv_keys()
    print(keys.__str__())


    var values = dotenv_values()
    print(values.__str__())

    var key1 = get_key("KEY")
    print(key1)

    var value = set_key("KEY", "VALUE")
    print(value)

    print('mojo dotenv version: ', __version__)