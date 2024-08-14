#!/usr/bin/python3
"""
This module provides a recursive function to query the Reddit API and return
a list containing the titles of all hot articles for a given subreddit.
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """A function that returns top ten post titles recursively"""

    headers = {'User-Agent': 'Mozilla/5.0'}
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    parameters = {'after': after}
    results = requests.get(url, params=parameters, headers=headers,
                           allow_redirects=False)

    if results.status_code == 200:
        after_data = results.json().get("data").get("after")
        all_titles = results.json().get("data").get("children")
        for post in all_titles:
            hot_list.append(post.get("data").get("title"))
        if after_data is None:
            return hot_list
        else:
            return recurse(subreddit, hot_list, after_data)
    else:
        return (None)
