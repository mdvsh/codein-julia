using OAuth

consumer_key = "nMA1FnkqPPznSMtb0jXA6xVlF"
consumer_secret = "iOei8ncoo7jnnxcCFF0UaUlReAwP86ZJfgUZ9MzUbQl7PSMHyA"
access_token = "1207878518236823558-6kBmuzjSj2TyVJ2r399A9eof1hIfb9"
access_token_secret = "Cdqr0X3YtDegXIVivFfZer7wBZRKPmvbQbg7EFHnj8wwu"

get_oauth(endpoint::String, options::Dict) = oauth_request_resource(endpoint, "GET", options, consumer_key,
consumer_secret, access_token, access_token_secret)

tweet_oauth(endpoint::String, options::Dict) = oauth_request_resource(endpoint,"POST", options, consumer_key, consumer_secret,
access_token, access_token_secret)

# Will delete the keys once I setup github actions to schedule a tweet. 
