---
layout: post
title: Brownian Process
author: Prakrut Chaubal
date: 2023-03-15 10:22:00 +1100
categories: [finance]
tags: [finance]
math : true
---
# Introduction
I will look at some of the mathematical properties of Brownian motion in this post. This post is a part of the self study financial mathematics notes from Shreve's
book. There is very little original content here except some code snippets. 

#### Definition[^shreve]
Let us first look at the formal definition and then try to get an intuitive understanding of Brownian motion.
Let $ ( \Omega, \mathcal{F}, P ) $ be a probability space. For each $\omega \in \Omega$ suppose there is continuous function W($t$) for $ t \geq 0 $ that satisfies W(0) = 0. Then W($t$) is a Brownian motion if for all $ 0 =t_0 \le t_1 \le t_2 \ \dotsc \ \le t_m$, the increments $W(t_{n-1}) - W(t_{n})$ are independent and each of these increments is normally distribued with 0 expectation value with the variance given by time difference.

Suppose we want to generate such a Brownian motion for some time points *t* which need not be evenly spaced. A good way to think about such a motion would be 
```python
def Brownian_motion(t):
    for i, t_i in enumerate(t):
        if i == 0:
            W[i] = t_i * np.random.randn()
        else:
            W[i] = W[i-1] + np.sqrt(t[i] -t[i-1]) * np.random.randn()
    return W
```
{% raw %}<div>{% endraw %}
  {% raw %}<iframe src="/plots/brownian/file.html" width="100%" height="500px"></iframe>{% endraw %}
{% raw %}</div>{% endraw %}

However, this naive implementation has some undersirable properties and there are better ways to simulate a Brownian process. 

# Properties
## Filteration
Filteration is a notation to denote the amount of information available at each time. It is denoted as $\mathcal{F}(t)$ and informally, it is a collection of properties:
1. Information accumulation: There is at least as much information $\mathcal{F}(t_2)$ available at later time $t_2$ as there is at an earlier time $\mathcal{F}(t_1)$.
2. Adaptivity: The information available at time $t$ is sufficient to evaluate the Brownian motion $W(t)$ at that time.
3. Independence of Future: Any increment of the Brownian motion after time $t$ is independent of the information available at time $t$.
## Distribution
## Martingale Property
A sequence of random variables is said to possess *Martingale property* if the conditional expectation of the next value in the sequence is equal to the present value, regardless of all prior values:

$$ \mathbb{E} \left[ X_{n+1} | X_{1}, \dotsc , \  X_{n} \right] = X_{n} \ . $$

To show that the Brownian process is *Martingale*, consider that we have the entire path $\mathcal{F}(s)$[^note1] upto some point $s$ and we look for the expectation value for some time $t \gt s$. We have,

$$\begin{aligned} 

\mathbb{E} \left[ W(t) | \mathcal{F}(s) \right] & = \mathbb{E} \left[ W(t) - W(s) + W(s) | \mathcal{F}(s) \right] \\
& = \mathbb{E} \left[ W(t) -W(s) | \mathcal{F}(s) \right] + \mathbb{E} \left[ W(s) | \mathcal{F}(s) \right] \\
& =  \mathbb{E} \left[ W(t) -W(s)  \right] + \mathbb{E} \left[ W(s) | \mathcal{F}(s) \right] \\
& =  0 + W(s) \ .
\end{aligned}$$

## Markov Property
A stochastic process is said to possess *Markov* property if the conditional property distribution of the future states of events depends only upon the present state. It is easy to see that a Martingale process is Markov. We can even show a stronger result - the  

# First Passage Time and its Distribution
The time it takes for a random process, such as the Brownian process, to reach a distance $m$ away from its origin is known as the **First Passage Time**.  

# Variation
## First Order Variation
The first order variation is defined as the integral of the absolute of first derivative of the function:

$$
V_1 = \int_0^{T} |f'(t) | dt
$$

## Quadratic Variation
Similar to the first order variation, the quadratic variation is defined as,

$$
V_2 = \int_0^{T} |f''(t) | dt
$$

Brownian motion accumulates quadratic variation equal to the length of the interval.

```python
def quadratic_variation(W):
    np.cumsum(np.power(np.diff(W)))
```


# References and Notes
[^shreve]: Steven E. Shreve, Stochastic Calculus for finance II - Continuous Time Models
[^note1]: $\mathcal{F}(s)$ is a filteration -  a collection of $\sigma$-algebras with some specific properties. But I omit the formal definition here and note an important property - the future increments of the Brownian process are independent of the information available at present. 
