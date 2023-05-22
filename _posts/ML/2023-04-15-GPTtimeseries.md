---
layout: post
title: How good is GPT for Time Series analysis?
author: Prakrut Chaubal
date: 2023-04-15 15:22:30 +1100
categories: [ML]
tags: [Machine Learning]
math : true
mermaid: true
---
tldr; 
Testing two hypothesis,
1. GPT models are great at learning large scale correlations with timeseries
2. GPT models able to store some information about a 'metastate' which helps it talk about some context


Unless you are living under a rock, you should now be fed up of people telling you how is awesome is the GPT architechture for large language models. GPT-3.5 and GPT-4 models have already shown exceptional potential at making bots which seem to have AGI and are smart enough for most purposes to give a feel of a real intelligence talking to us. What amazes me more is that all of this is done with an algorithm whose task to predict the next word in the sequence. If next word prediction is all that it is doing, then the model is amazing at remembering those large scale correlations which allows it to keep on talking about the same topic, giving us a sense that it knows something about the subject.

What disappoints me with the success of LLMs is that people do actually think that the model has some kind of thinking ability. I would be happy if we are able to make something that has actual thinking ability, but after looking at the architechture of the underlying model, I refuse to consider that something so simple is actually able to think. However, I do not deny that it does actually seem as if these models do under what they are talking. Therefore, I am going to test out a hypothesis that by account for large scale correlations alone, the machine is able to convince us of posessing intelligence. For this, I am going to create a time series and inject signal into it at different time scales. I am going to inject signal at larger and larger time scales until the model breaks/performs bad. Then I will give the model more parameters and repeat untill the either the model fails or I am limited by hardware.

If GPT class of models are so great about taking into account large scale correlations, can it predict such large scale correlations in time series data too? How does it compare to other time series forecasting methods? Can we device a test where we could test its limits? If we could device such a test, would that tell us something more about the limits of this architechture? And if could see the limitations of this model, can do something to improve these limitations to make large language models better?

 
# Data

# Toy GPT models
# Testing Limits of GPT models
# Comparing with BERT, and Statistical forecasting
# Takeways
