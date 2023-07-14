import requests

owner = "username"  # Replace with the owner's username or organization name
repo = "repository-name"  # Replace with the repository name

url = f"https://api.github.com/repos/{owner}/{repo}"
headers = {"Accept": "application/vnd.github.v3+json"}

response = requests.get(url, headers=headers)
data = response.json()

description = data["description"]
print("Project Description:", description)
