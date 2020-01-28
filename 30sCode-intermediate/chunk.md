---
title: chunk
tags: array,intermediate
---

Chunks an array into smaller arrays of the specified size.

Use array comprehension, `min()` and `length()` to create an array of arrays of length `n` from the given array, `arr`.

```jl
function chunk(arr, n)
  return [arr[i:min(i + n - 1, end)] for i in 1:n:length(arr)]
end
```

```jl
chunk([1,2,3,4,5],2) # [[1, 2], [3, 4], 5]
chunk([1, 2, 3, 4, 5, 6, 7, 8, 9], 4) # [[1, 2, 3, 4], [5, 6, 7, 8], [9]]
```
