---
title: is_divisible
tags: math,beginner
---

Checks if the a number is divisible by another number.

Use `mod()` to check if the remainder of dividing `dividend` by `divisor` is equal to `0`.

```jl
function is_divisible(dividend, divisor):
  mod(dividend, divisor) == 0
end
```

```jl
is_divisible(42, 7) # true
is_divisible(13, 2) # false
```
