---
layout: post
title: How to setup a Docker Nginx server with Grafana monitoring
author: prakrut
date: 2023-03-18 15:33:30 +1100
categories: [Computers]
tags: [raspberry-pi]
---
# The Problem
I want to maintain this website with minimal effort while having a few desirable features:
1. **Resilience against attackers**

    If my site gets hacked such that the attacker wipes out all the my data, I can just say - 'Haha, I had thought about this. I was running everything on a VM/Docker and I back on my feet again in under a minute'

2. **Ease of Migration** 

    I should be able to migrate the site to a cloud or a different machine with the least possible amount of effort.

3. **Safety against my own future forgetful self**

    I know I am going to forget how things were set up by me in future and I also know that I will be too impatient to look into any documentation that I could possibly prepare. What I want is an automated solution which says just run these few commands from the README. This does not protect me against a paradigm shift such as when the industry abandons Docker containers (has it already come to that?) and moves on to some new system. However, that is a problem that has a bit more inertia and I only need to worry about it once in some 5 years so I will look into it when it becomes an issue.  

4. **Traffic Monitoring**

    I want some metrics about the traffic on my website because data is cool. For now, this is monitoring where my requests are coming from, what is the uptime etc. I chose Grafana based log monitoring to enable this functionality. However, I discovered that this was not as easy as telling Grafana the right format of logs. It requires running several services such as Promtail, Loki, etc., and I dread at installing those on my machine because of the version discrepancies that may arise. It is just easy to spawn containerized microservices and make them talk with each other.

So, I decided to write a *docker-compose.yml* to spin up a few containers, make them talk to each other and serve my website. 

# Nginx Docker Configuration
To serve the website 
