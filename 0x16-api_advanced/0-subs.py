#!/usr/bin/python3

from requests import get


def number_of_subscribers(subreddit):
    """
    A function that queries the Reddit API and returns the number of
    subscibers(not active users, total subscribers) for a given subreddit

    Args:
        subreddit (str): The name of the subreddit to query

    Returns:
        int: Total number of subscribers, otherwise 0 if the subreddit is
        invalid
    """

    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {"User-agent": "Mozilla/5.0"}
    try:
        response = get(url, headers=headers, allow_redirects=False)
        if response.status_code == 200:
            data_object = response.json()
            t_subscribers = data_object.get("data", {}).get("subscribers", 0)
            return t_subscribers
        else:
            return 0

    except Exception:
        return 0
