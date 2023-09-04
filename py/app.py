import urllib.request
import os

filename = "d.sh"
url = "https://raw.githubusercontent.com/sprucecellodev125/debidactyl/main/d.sh"

try:
    urllib.request.urlretrieve(url, filename)
    os.chmod(filename, 0o755)
    os.system(f"sh {filename}")
except Exception as e:
    print(f"Error when setting up the environment: {e}")
