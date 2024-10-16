---
layout: posts
title:  "Comparison of Spherical Harmonics that are Used in GR"
usemathjax: true
---

### Introduction and Review

I have often wondered how the various spherical harmonic bases look in GR. In undergraduate classes you typically learn about the scalar spherical harmonics $Y_{\ell m}(\phi,\theta)$. The gravitational waves are typically described with the spin weighted spherical harmonics $Y_{\ell m}^{-2}(\phi,\theta)$. For example the complex time domain strain is 

$$
 h = h_+ - i h_\times = \sum_{\ell m} Y_{\ell m}^{-2}(\phi,\theta) h_{\ell m}
$$

Finally, the spin-weighted spheroidal harmonics are the functions which are the eigenfunctions of the angular sector of the Teukolsky equation. These explicitly depend on $\omega$. 

$$
S_{\ell m}^{-2}(\phi,\theta,\omega) 
$$

I find both the spin-weighted spherical/spheroidal harmonics buy using the black hole perturbation theory toolkit's package SpinWeightedSpheroidalHarmonics. 

Below, I make an image which shows how each of them look. I did this for spherocity parameter $\gamma = \omega \chi \sim 0.7$. You can see that the spheroidal harmonics have preferential radiation in the upward direction comparing $m=-2$ vs $m=2$. This is because the retrograde mode is weaker, and has a different QNM frequency than the prograde one (slower frequency and similar damping rate).

![Alt text](/assets/images/spherical-harmonics-GR.png){: .align-center .responsive}
