# This wouldn't be possible without this https://github.com/R3l3ntl3ss/Meme_Api.
# Also, thank you to Twitter for approving my developer account request in a day. You rock!

using HTTP, JSON, Base64
include("authorizn.jl")

API = "https://meme-api.herokuapp.com/"

post_url = "https://api.twitter.com/1.1/statuses/update.json"

upload_url = "https://upload.twitter.com/1.1/media/upload.json"

function step_one(name)
    image_data = ""
    image_size = 0
    try
        open(name) do file
            image_data = read(file)
            image_size = stat(file).size
        end
    catch
        println("not found...")
        exit(1)
    end
    s1 = Dict("command" => "INIT","total_bytes" => image_size,"media_type" => "image/jpeg","media_category" => "tweet_image")      
    bot_init = tweet_oauth(upload_url, s1)
    json = JSON.parse(String(bot_init.body))
    return step_two(image_data, json["media_id"])
end

function step_two(image_data, media_id)
    s2 = Dict("command" => "APPEND", "media_id" => media_id, "media" => base64encode(image_data),"segment_index" => 0)
    r_append = tweet_oauth(upload_url, s2)
    return step_three(media_id)
end

function step_three(media_id)
    s3 = Dict("command" => "FINALIZE", "media_id" => media_id)
    r_final = tweet_oauth(upload_url, s3)
    return media_id
end

function get_meme()
    subs = ["PewdiepieSubmissions","ProgrammerHumor","mathmemes"]
    randomsub = rand(1 : 3, 1)[1]
    url = API*"gimme/"*subs[randomsub]*"/1"
    req = HTTP.request("GET", url)
    json = JSON.parse(String(req.body))
    imagel_ink = json["memes"][1]["url"]
    type = split(imagel_ink, ".")[end]
    img_name = "image.$type"
    println("status: ", req.status)
    download(imagel_ink, img_name)
    return json, img_name
end

function tweet()
    meme, name = get_meme()
    post_link = meme["memes"][1]["postLink"]
    title = meme["memes"][1]["title"]
    media_id = step_one(name)
    options = Dict("status" => "$title\nSource: $post_link\n\n-By http://bit.ly/PseudoCodeNerd-memeBot", "media_ids" => media_id)
    r_tweet = tweet_oauth(post_url, options)
    println("(Testing) Status: ", r_tweet.status)
end

#Finally!
tweet()
