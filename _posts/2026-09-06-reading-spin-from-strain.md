---
layout: single
title:  "Interactive gravitational wave demonstration for spin and eccentricity"
excerpt: "Drag mass ratio, spin, precession, and eccentricity and watch the waveform change."
usemathjax: true
classes: wide
author_profile: true
published: true
header:
  teaser: /assets/images/teasers/2026-09-06-reading-spin-from-strain.png
---

Every binary black hole radiates the same basic chirp, so the parameters we measure have to be
hidden somewhere in its *shape*. The tool below lets you drag the mass ratio, the effective spin
and the precessing spin of a binary and compare the waveform against a pinned reference. Every
waveform is an [SEOBNRv5](https://arxiv.org/abs/2303.18046) model in dimensionless units:

* time is measured in units of the total mass $M$, with $t=0$ at the peak of $\lvert h_{22}\rvert$;
* the phase is set to zero at that peak, so two waveforms can be compared cycle by cycle;
* dimensionless amplitude $r h_{22}/(M\nu)$ plotted, the amplitude is divided by the symmetric mass ratio $\nu = q/(1+q)^2$ to make comparison easier.

{% include waveform-explorer.html %}


### How it is made

The page cannot run a waveform model live, so it carries a precomputed grid: 9 values of $q$
(log-spaced from 1 to 8), 7 values of $\chi_{\rm eff}$, 9 values of $\chi_p$ and 7 values of $e$, generated with
[`pyseobnr`](https://git.ligo.org/waveforms/software/pyseobnr) (SEOBNRv5HM for aligned spins,
SEOBNRv5PHM once $\chi_p > 0$, SEOBNRv5EHM once $e > 0$). Rather than storing inertial-frame modes, it stores the
co-precessing modes $(2,2)$, $(2,1)$, $(3,3)$, $(3,2)$, $(4,4)$, $(4,3)$ together with the Euler
angles of the frame rotation. In that frame every amplitude and phase is smooth, so the browser can
interpolate them in $\log q$ and $\chi_{\rm eff}$ and then rotate, with Wigner $D$-matrices, to the
frame of the total angular momentum $\mathbf{J}$, from which the inclination $\iota$ is measured
(this frame barely moves, which is what makes the interpolation physical; what it cannot resolve
between grid nodes is the orbital phase at merger relative to the precession cycle, equivalent to a
different initial in-plane spin azimuth),

$$
h^{\rm I}_{\ell m}(t) = \sum_{m'} D^{\ell}_{m' m}\big(\alpha, \beta, \gamma\big)\, h^{\rm P}_{\ell m'}(t),
\qquad
h_+ - i h_\times = \sum_{\ell m} {}_{-2}Y_{\ell m}(\iota, 0)\, h^{\rm I}_{\ell m} .
$$

* note that this approximation might have some slight incorrect ringing at high $q\sim8$ and high $\chi_p$, but for the bulk of the parameter space this is correct
