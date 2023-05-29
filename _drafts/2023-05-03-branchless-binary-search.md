---
layout: post
title: Branchless Binary Search
author: Prakrut Chaubal
date: 2023-05-03 02:22:00 +1100
categories: [Computers]
tags: [julia]
math : true
---
# Introduction
I came across a series of clever branchless binary search posts - [branchless binary search](https://news.ycombinator.com/item?id=35761296), [beautiful branchless binary search](https://probablydance.com/2023/04/27/beautiful-branchless-binary-search/), and [beautiful binary search in D](https://muscar.eu/shar-binary-search-meta.html).

While these posts share some deep insights about how to write an optimized version of binary search.
How far can lazy piece of code with a smart compiler take me? Withing a couple of orders of magnitude of the optimal code or within a few CPU cycles? If the answer is later, then I would always use the lazy piece of code while knowing that it could be improved by a little but the effort is not worth it.


I had a few specific questions to answer with this exercise:

1. Is branchless code really better than the one that uses `if-else` statements when used with a compiler? Is the compiler smart enough to spot this and make it better? 
2. How does the performance compare against a C implementation?
3. Does Julia create an optimized assembly code?
4. How does it compare against Julia's inbuilt `searchsorted` function?

For the impatient reader, jump to [Results](#results) and then go back to whichever code that piques your interest in [codes](#codes) and some further disection in [Comparing Assembly Codes](#comparingassembly) and [Profiling](#profiling).

> tldr; A naive implementation with conditional statements works much faster than even C++ code due to compiler magic.

# <a name="codes"></a> The codes
## Branchless codes
### Direct translation of branchless binary Python code into Julia code
```julia
function branchless_bisect(arr::Vector{Int}, value::Int)::Int
    left = 1
    right = length(arr)
 
    step_pow = (ndigits(right, base=2) - 1)
    step = 1 << step_pow

    # search in the right section if the value is greater than nearest
    # power of 2
    if arr[step] < value
        left = step +1
        step_pow = ndigits(right - left, base=2) -1
    end

    # Now iterate over step in powers of 2
    # changing the left pointer whenever the value is greater
    for step in [2^n for n in step_pow:-1:0 ]
        left += step*( arr[left+step-1]<value ) 
    end

    return left
end
```

### GPT-4 Version of branchless binary
Since we are talking about getting away being lazy, I also asked GPT-4 to write me a Julia binary seach code which it wrote as 

```julia
function branchless_GPT4(arr, target)
    left = 1
    right = length(arr)
    mid = (left + right) ÷ 2

    while left <= right && arr[mid] != target
        # Calculate the new bounds of the search space
        left = (arr[mid] < target) * (mid + 1) + (arr[mid] >= target) * left
        right = (arr[mid] > target) * (mid - 1) + (arr[mid] <= target) * right
        
        # Calculate the new midpoint
        mid = (left + right) ÷ 2
    end
    
    return mid * (arr[mid] == target) - 1 * (arr[mid] != target)
end
```

## Code with Conditional statements
### Julia's native implementation
Julia has a [native implementation](https://github.com/JuliaLang/julia/blob/17cfb8e65ead377bf1b4598d8a9869144142c84e/base/sort.jl#L298-L325) of binary search in `Base.Sort.searchsorted` and its source code looks like this

```julia
function searchsorted(v::AbstractVector, x, ilo::T, ihi::T, o::Ordering)::UnitRange{keytype(v)} where T<:Integer
    u = T(1)
    lo = ilo - u
    hi = ihi + u
    @inbounds while lo < hi - u
        m = midpoint(lo, hi)
        if lt(o, v[m], x)
            lo = m
        elseif lt(o, x, v[m])
            hi = m
        else
            a = searchsortedfirst(v, x, max(lo,ilo), m, o)
            b = searchsortedlast(v, x, m, min(hi,ihi), o)
            return a : b
        end
    end
    return (lo + 1) : (hi - 1)
end
```
### GPT-4 version 
```julia
function binary_search_GPT4(arr::Vector{T}, target::T) where T<:Real
    left = 1
    right = length(arr)
    
    while left <= right
        mid = (left + right) ÷ 2
        
        if arr[mid] == target
            return mid
        elseif arr[mid] < target
            left = mid + 1
        else
            right = mid - 1
        end
    end
    
    return -1
end
```

### Optimized Conditional version
After tinkering around with the binary search codes, I thought I could write an optimized verison which could beat all. There are two simple ideas used to make this version:
1. Remove the third branch which checks if the midpoint is equal to the value and let the compiler optimize the if-else conditional statement. In the worst case scenario, we only pay the price of $log_{2} n$ more cycles.
2. Remove the bounds checking step with `@inbounds` macros just like the native implementation does.

When run through the profiler, this version has 0 allocations.

```julia
function bisect_op(arr::Vector{Int}, target::Int)::Int
    left = 1
    right = length(arr)
 
    @inbounds while left < right
        mid = left + (right - left) ÷ 2
        if arr[mid] < target
            left = mid + 1
        else
            right = mid
        end
    end
    return left
end
```
# <a name="Results"></a> Results
## Julia codes
## Comparing with Python and C++ codes


# <a name="comparingassembly"></a> Comparing Assembly


# Benchmark Results
## Branchless
![Branchless Binary Search](/images/binary_search/bb.png)
## Branchless GPT-4
![Branchless GPT-4 Binary Search](/images/binary_search/branchless_gpt4.png)
## Conditional GPT-4
![Binary Search GPT-4](/images/binary_search/bisect_gpt4.png)
## Julia native
![Julia Native Binary Search](/images/binary_search/julia_native.png)
## Optimized Conditional version
![Optimized Binary Search](/images/binary_search/bisect_opt.png)


# Closing Remarks
I am sure I am being stupid in the branchless code and it would be great if someone points out how to make it faster. If you are someone who can spot my mistakes, please reach out to me. It puzzles me how a branchless code is slower than the one with with a control flow statement. 


