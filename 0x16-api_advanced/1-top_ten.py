#!/usr/bin/python3

"""
This module provides a function to query the Reddit API and print
the titles of the first 10 hot posts listed for a given subreddit.
"""

from requests import get


def top_ten(subreddit):
    """
    Queries the Reddit API and prints the titles of the first 10 hot posts
    for a given subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        response = get(url, headers=headers, allow_redirects=False)

        if response.status_code == 200:
            data_object = response.json().get("data", {}).get("children", [])
            if not data_object:
                print(None)
            else:
                for post in data_object:
                    print(post.get("data", {}).get("title"))

        else:
            print(None)
    except Exception:
        print(None)
