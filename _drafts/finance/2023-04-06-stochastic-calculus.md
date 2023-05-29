---
layout: post
title: Stochastic Calculus
author: Prakrut Chaubal
date: 2023-04-06 11:30:00 +1100
categories: [finance]
tags: [finance]
math : true
---
For an adapted stochastic process $\Delta (t)$[^note1], what does it itegral wrt a Brownian motion $W(t)$ 

$$
\int_0^{T} \Delta (t) dW{t}
$$

mean? This integral is called Ito integral. Brownian motion is not differentiable and therefore we need to device a way to make sense of this integral first. This was done by Ito and thus we call it Ito integral.

# Ito's Lemma 
## Simple form

# Properties
1. Ito integral is a martingale
2. Ito isometry $E [ I^2(t)] = E \int_0^t \Delta^2(u) du$ - i.e similar space between two point
3.


# References and Notes
[^note1]: Adaptive means all the information available upto time $t$ is sufficient to evaluate the process at time $t$.
