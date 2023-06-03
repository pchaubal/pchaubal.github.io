---
layout: post
title: Neural ODE solver
author: prakrut
date: 2023-04-29 14:24:00 +1100
categories: [Computers, ML]
tags: [Machine Learning, Physics]
math : true
---
# Introduction
The Cosmic Microwave Background (CMB) radiation is the left over of the Big Bang that provides us the earliest snapshot of the Universe. This radiation is isotropic with small random fluctuations. Despite the random nature of these perturbations, our physical models allow us to predict the some statistical propeties of these fluctuations such as the power spectrum. This post is all about the physical modelling of the power spectrum. Although, the real equations and quite involved and there are finite element codes to solve the underlying coupled ordinary differential equations (ODEs), this post explores the possibility of solving these ODEs with Hamiltonian Neural Networks.

The readers who are interested in ML can skip to 

# A brief tour of Cosmological Peturbation Theory

# Introduction to Hamiltonian Neural Networks
Neural Networks have a remarkable ability to mimic any function. There is a hueristic postulate which states that given a sufficiently wide and deep neural network, it is possible to emulate any function with it. Although, the functions required to be learnt vary across differnt problem domains, all the problems obey the same underlying physical laws. The motivation of HNN is whether we can define a class of neural networks which precisely conserve energy like quantities over time? Can we learn the Hamiltonian of the system thereby circumventing the domain specific physics knowledge directly from the data?

## Formulation of HNN


# References

