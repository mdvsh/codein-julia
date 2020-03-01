# api-endpoint-stackoverflow.jl

##  👨‍💻 O.S Code Task  👨‍💻

## Deliverable
1. [Pull Request](https://github.com/logankilpatrick/StackOverflow.jl/pull/15)

Added three functions from the StackOverFlow API.

1. [`getusers`](https://api.stackexchange.com/docs/users) [0617d18](https://github.com/logankilpatrick/StackOverflow.jl/commit/0617d186e5365a3a90ae6e9d822c16440597d6f8)
2. [`getcomments`](https://api.stackexchange.com/docs/comments) [a9ee764](https://github.com/logankilpatrick/StackOverflow.jl/commit/a9ee764a594699dd92ee29d7a1cc9b0c4fb9d11d)
3. [`getsuggested_edits`](https://api.stackexchange.com/docs/suggested-edits) [fec26a9](https://github.com/logankilpatrick/StackOverflow.jl/commit/fec26a92b4a7fa8e2d86246f16322400c786779b)
<hr>

## Add an additional API Endpoint to StackOverflow.jl
### Task Description

[StackOverflow.jl](https://github.com/logankilpatrick/StackOverflow.jl) is a wrapper of the Stack Overflow API in Julia.

For this task, you will be wrapping additional pieces of the [Stack Exchange API.](https://api.stackexchange.com/docs)

Look through the docs linked above, and find a part of the API that has not been wrapped yet in Julia. Write a Julia function in the correct folder that interacts with the API endpoint.

For a good example of how this is done let's take a look here. Now that you have seen that, look [here](https://api.stackexchange.com/docs/info).

Make sure that:

- If you add a new file you include and export the function in the StackOverflow.jl file.
- Test locally before you submit a PR.
- You DO NOT wrap a function that requires OAuth.

When you are done:

- Test the new function locally.
- Add a test of the function to runtests.jl
- Add a comment with the link from the Stack Overflow docs.
- Open a PR to the main StackOverflow.jl repo.

Feel free to ping me on Slack if you have any questions.

<hr>