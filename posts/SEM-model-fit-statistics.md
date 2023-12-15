---
title: "Summary of SEM Model Fit Statistics"
date: 2023-12-15T09:25:33-05:00
---

I can never keep track of the various model fit statistics. Thankfully, the book
[Handbook of Structural Equation
Modeling](https://www.guilford.com/books/Handbook-of-Structural-Equation-Modeling/Rick-Hoyle/9781462544646)[^1]
includes a chapter by West et al[^2] including this handy chart:

[<img src="../west_et_al_fit_statistics.png" width=600px/>](../west_et_al_fit_statistics.png)

A few other notes I've collected:

&chi;<sup>2</sup>:
- For over ~400 obs, &chi;<sup>2</sup> is less useful because it almost always
  rejects. (Citation is the Mutht&eacuten article linked below under SRMR.)
- We want it to *fail* to reject, so that saturated model is NOT better.
- A lot of people recommend ignoring this.

SRMR:
- Measure of "approximate fit", as opposed to &chi;<sup>2</sup> which is "exact
  fit" (and unrealistic in large data situations).
- Mutht&eacute;n (author of Mplus)
  [suggests](https://www.statmodel.com/download/SRMR2.pdf) the following steps:
  1. If &chi;<sup>2</sup> fails to reject, we have a good "exact fit" and
   there's no need to use SRMR to examine approximate fit.
  2. If &chi;<sup>2</sup> rejects, and SRMR is < .08, and there's no large
     residuals, model is approximately fit. (With larger samples, n > 200)
  3. &chi;<sup>2</sup> rejects, SRMR > .08, poorly fitting model

TLI/CLI:
- Functions of &chi;<sup>2</sup>/df ratio
- TLI can be outside 0/1, but usually truncated. CLI always in [0,1].
- Only useful in large sample sizes or  large DF
- Minimum DF is 2
- Muthe&eacute;n discusses it
  [here](https://www.statmodel.com/download/TLI.pdf).

[^1]: Hoyle, Rick H., ed. Handbook of structural equation modeling. Guilford
    press, 2012.
[^2]: West, Stephen G., Aaron B. Taylor, and Wei Wu. "Model fit and model
    selection in structural equation modeling." Handbook of structural equation
    modeling (2012): 209-231.
