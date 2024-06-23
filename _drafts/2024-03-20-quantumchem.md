---
layout: post
title: Introduction to Quantum Chemistry
author: Prakrut Chaubal
date: 2024-03-20 20:35:30
categories: [science]
tags: [quantum, chemistry]
math : true
---
# What is Quantum Chemistry?
Suppose we wanted to simulate a bunch of classical particles interacting with each other electromagnetically. To simulate this process we begin by specifying the positions and momenta of all the particles. We can then calculate the electromagnetic potential at the location of a particle due to every other particle. The sum of the all these two-particle potentials would give us the total potential at the paticle's position. Since the force on the particle is just the derivative of the potential, the knowledge of the potential allows us to calculate the instantaneous acceleration of the particle. We can now evolve the system by a small time-step and update the position and the velocity of the particle. By repeating the process for all the particles at each time-step, we have a crude version of simulating the a classical system of interacting particles.

Why can we not use the same process for simulating a system of electrons?

To understand the problem, let us make the method for simulating classical particles more precise.

At every timestep, for every particle, we are trying to solve the equation of motion,
$$
\frac{\d^2x}{dt^2} = -\nabla^2 \phi (x) \ ,
$$
where $x$ is the position of the particle and $\phi$ is the electromagnetic potential of the particle due to all other particles. It is easy to see that we are integrating this equation with respect to time to find the solution $x$.
