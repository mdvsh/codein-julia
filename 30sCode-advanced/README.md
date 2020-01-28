# 30sCode-advanced

## 👨‍💻  Code Task 👨‍💻

## Deliverable

1. [**Pull Request**](https://github.com/30-seconds/30-seconds-of-julia/pull/45)
   - Added snippet : Jaro-Winkler Similarity (i.e Jaro Distance) #45 
   - [`jaro_distance.md`](./jaro_distance.md)

### Description

This snippet returns the [Jaro-Winkler distance](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance#Jaro_Similarity) of two given strings.

The Jaro distance is a measure of similarity between two strings and is different from the [Levenshtein Distance](https://en.wikipedia.org/wiki/Levenshtein_distance).
Levenshtein counts the number of edits (insertions, deletions, or substitutions) needed to convert one string to the other while the Jaro similarity is a measure of characters in common, being no more than half the length of the longer string in distance, with consideration for transpositions. It's suited for suited for comparing smaller strings like words and names.

The distance in this snippet is normalized such that 0 equates to no similarity and 1 is an exact match.

<hr>

## Create an "Advanced" level Julia Code Snippet for 30-seconds-of-Julia

### Task description

Create a snippet for the [30-seconds-of-Julia repo.](https://github.com/30-seconds/30-seconds-of-julia)

**Make sure this task is Advanced level. See the Python repo for examples of Advanced tasks**

### You should:

- Open a Pull Request with the word "WIP" in the title to claim a specific exercise.

- Look at the existing snippets in the repo to model the formatting

- Look at 30-Seconds-of-Python snippets or other languages in the 30-seconds org to find possible snippets to create in Julia

- Finish the pull request with your original markdown file that includes the example.

### You should not:

- Copy other peoples code or work

- Make snippets using built-in functions. It's important that you don't create a snippet for something that already exists in base Julia. If the snippet is to see if the elements of an array are unique, and Julia has an isunique() function, then do not create this snippet.

Look to the Julia docs for references on how to do certain things.

<hr>