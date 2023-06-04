---
layout: post
title: The Black Littermann model
author: Prakrut Chaubal
date: 2023-01-02 17:22:30 +1100
categories: [finance]
tags: [finance]
math : true
---
# Introduction
The Markovitz optimization approach provides a mathematical solution to the problem of allocating funds to a collection of assets. However, it is impractical to implement such a solution as the estimates of mean returns and covariances inferred from market data are noisy which leads to unstable behaviours. Moreover, such an approach only takes into account historic behaviour of the market while ignoring future forecasts. Black and Littermann provide a solution to the problem of portfolio allocation while incorporating future views on a security and averting unstable behaviour.

# The Model
Let us consider the market comprising of N securities and the returns of which are normally distributed,

$$
X \sim \mathcal{N}(\mu, \Sigma) \ ,
$$

where, $\Sigma$ is the covariance matrix. Estimating the covariance matrix is a different problem and there can be several approaches to it. We will postpone its discussion for later. For now, consider we know the covariance matrix. The mean return $\mu$ is also unknown which has to be inferred from the data. Black and Littermann (BL) address this issue by modelling $\mu$ as a random variable with a Normal distribution,

$$
\mu = \mathcal{N}(\pi, \Sigma') \ .
$$

Now, BL take a different approach from the classical Markovitz optimization. BL argue that the market has already allocated assets at the efficient frontier according to Markovitz optimization with some unknown risk aversion level $\bar{\lambda}$ and the expected returns. 

## The Pick Matrix - $P$
Usually, we have some opinions about how some securities are going to perform in the future, i.e. what returns $\mu$ we expect from some asset in the future. If we have $V$ such views for $N$ securities ($V \leq N$) then we can represent these views with a ($V \times N$) pick matrix - $P$.

We will see the mathematical derivation of the BL equation later but first let us directly skip to the results. The mean returns $\mu$ obtained from incorporating the views into the current maket evaluations are normally distributed with mean $\mu_{BL}$ and covmat $\Sigma_{BL}$
$$
$$

$$
\mu_{BL} = \left( \Sigma'^{-1} + P^T \Omega^{-1} P \right)^{-1} \left( \Sigma'^{-1} \pi + P' \Omega^{-1} v  \right)
$$

# How sensible are the model assumptions?
# Python Implementation
# Backtesting
# Improvements
