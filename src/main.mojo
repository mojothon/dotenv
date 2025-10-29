from dotenv import load_dotenv, get_key, set_key, dotenv_keys


# 使用示例
fn main() raises:
    # 加载 .env 文件
    load_dotenv()
    
    # 获取环境变量
    var db_host = get_key("DB_HOST", "localhost")
    var db_port = get_key("DB_PORT", "5432")
    
    print("数据库主机:", db_host)
    print("数据库端口:", db_port)
    
    # 设置新的环境变量
    var success = set_key("NEW_VAR", "test_value")
    print("设置变量结果:", success)
    
    # 获取所有 .env 文件中的键
    var keys = dotenv_keys()

    for item in keys:
        print(item)
    print("所有键:", keys.__str__())