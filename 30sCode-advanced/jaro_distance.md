---
title: jaro winkler similarity
tags: strings,advanced,utility
---
This snippet returns the [Jaro-Winkler distance](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance#Jaro_Similarity)  of two given strings.

The Jaro distance is a measure of similarity between two strings and is different from the [Levenshtein Distance](https://en.wikipedia.org/wiki/Levenshtein_distance).

Levenshtein counts the number of edits (insertions, deletions, or substitutions) needed to convert one string to the other while the Jaro similarity is a measure of characters in common, being no more than half the length of the longer string in distance, with consideration for transpositions. It's suited for suited for comparing smaller strings like words and names.

The score is normalized such that 0 equates to no similarity and 1 is an exact match.

```jl
function jaro_distance(s1, s2)
  l1 = l2 = m = p = t = 0
  match = max(length(s1), length(s2)) / 2 - 1
  for i in s1[1:end]
    l1 += 1
    l2 = 0
    for j in s2[1:end]
      l2 += 1
      if i == j
        if abs(l2 - l1) ≤ match
          m += 1
        end
        if l2 == l1
          p += 1
        end
      end
    end
  end
  t = (m - p) / 2
  if m != 0 
    d = 1 / 3 * (m / length(s1) + m / length(s2) + (m - t) / m)
    return d
  else
    return 0
  end
end
```

```jl
jaro_distance("JULIA", "JULIEN") # 0.82
jaro_distance("KEVIN", "MELVIN") # 0.6972
jaro_distance("RUTH", "RANDALL") # 0.4642
```
