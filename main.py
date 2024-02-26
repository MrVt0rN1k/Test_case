import requests
api_token ="YourApiKeyToken"
def get_result(url=f"https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey={api_token}"):
    result = requests.get(url)
    result_data = result.json()
    result = result_data["result"]
    return result


def get_height(url="https://api.blockcypher.com/v1/eth/main"):
    height = requests.get(url)
    height_data = height.json()
    height = height_data["height"]
    return height


comparison = int(get_result(), 16) == int(get_height())
if get_result() == "Max rate limit reached, please use API Key for higher rate limit":
    print("Max rate limit reached, please use API Key for higher rate limit")
else:
    print(comparison)