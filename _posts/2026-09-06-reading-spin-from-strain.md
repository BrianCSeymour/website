---
layout: single
title:  "Reading spin from strain"
excerpt: "Drag mass ratio, spin and precession and watch the waveform change."
usemathjax: true
classes: wide
author_profile: true
published: false
header:
  teaser: /assets/images/teasers/2026-09-06-reading-spin-from-strain.png
---

Every binary black hole radiates the same basic chirp, so the parameters we measure have to be
hidden somewhere in its *shape*. The tool below lets you drag the mass ratio, the effective spin
and the precessing spin of a binary and compare the waveform against a pinned reference. Every
waveform is an [SEOBNRv5](https://arxiv.org/abs/2303.18046) model in dimensionless units:

* time is measured in units of the total mass $M$, with $t=0$ at the peak of $\lvert h_{22}\rvert$;
* the phase is set to zero at that peak, so two waveforms can be compared cycle by cycle;
* the amplitude is divided by the symmetric mass ratio $\nu = q/(1+q)^2$, which takes out the
  leading-order $q$ dependence of the amplitude and leaves only the shape.

{% include waveform-explorer.html %}

The links below re-set the explorer to a configuration worth looking at.

### Mass ratio

<a class="wfx-try" href="#q=8&ce=0&cp=0&rq=1&rce=0&rcp=0&view=mode&inc=0&win=full">Try $q = 8$ against $q = 1$.</a>
Once the amplitude is divided by $\nu$ the two envelopes lie almost on top of each other — the
peak of $r h_{22}/(M\nu)$ changes by under 20% between equal masses and $q = 8$. What mass ratio
really changes is *timing*: the unequal-mass binary creeps through many more cycles before it
merges, which you can read off the "cycles to merger" tile, and its ringdown frequency is lower
because the remnant spins more slowly.

### Aligned spin and the orbital hang-up

<a class="wfx-try" href="#q=1&ce=0.7&cp=0&rq=1&rce=-0.7&rcp=0&view=mode&inc=0&win=full">Try $\chi_{\rm eff} = +0.7$ against $\chi_{\rm eff} = -0.7$.</a>
Spin aligned with the orbital angular momentum holds the binary apart through the spin–orbit
coupling, so it inspirals for longer, reaches a higher frequency and a larger amplitude before
plunging. Anti-aligned spin does the opposite. In the $M\omega_{22}$ panel this is the whole
story: the same chirp, stretched or compressed in time, and ending at a different ringdown frequency.

### Eccentricity

<a class="wfx-try" href="#q=1&ce=0&cp=0&e=6&rq=1&rce=0&rcp=0&re=0&view=mode&inc=0&win=full">Try $e = 0.3$ at the start frequency against a circular binary.</a>
An eccentric orbit radiates in bursts: every periastron passage pulses the amplitude and the
frequency once per radial period, and the $M\omega_{22}$ panel shows the frequency swinging up and
down on top of the chirp. Radiation reaction circularises the orbit, so the pulses fade toward
merger — eccentricity is a low-frequency signature, which is why detecting it needs the early
inspiral. These waveforms are SEOBNRv5EHM, which is aligned-spin; no SEOBNRv5 model has both
eccentricity and precession yet, so the two sliders are exclusive, and eccentric cases are shown
at exact grid points rather than interpolated (blending two eccentric waveforms with different
periastron timing would smear the pulses away).

### Precession

<a class="wfx-try" href="#q=8&ce=0&cp=8&rq=8&rce=0&rcp=0&view=mode&inc=0&win=merger">Try $\chi_p = 0.8$ at $q = 8$ against the same binary with no in-plane spin.</a>
In-plane spin makes the orbital plane precess about the total angular momentum, with the opening
angle shown in the bottom panel. In the co-precessing frame not much changes — the
$M\omega_{22}$ curves stay close — but the $\ell = m = 2$ mode measured in a fixed frame is
modulated at the precession rate, because power is being reshuffled between the $m$ values of the
$\ell = 2$ multiplet.

### Inclination and higher modes

<a class="wfx-try" href="#q=8&ce=0&cp=8&rq=8&rce=0&rcp=0&view=polall&inc=0&win=late">Try the polarisation $h_+$ face-on</a>, then
<a class="wfx-try" href="#q=8&ce=0&cp=8&rq=8&rce=0&rcp=0&view=polall&inc=90&win=late">turn the binary edge-on.</a>
Face-on you only ever see the $(2,\pm 2)$ modes. Edge-on, the $(2,1)$, $(3,3)$ and $(4,4)$ modes
appear, and precession becomes far easier to see — which is why precession is a property of the
observer as much as of the binary.

### How it is made

The page cannot run a waveform model live, so it carries a precomputed grid: 9 values of $q$
(log-spaced from 1 to 8), 7 values of $\chi_{\rm eff}$, 9 values of $\chi_p$ and 7 values of $e$, generated with
[`pyseobnr`](https://git.ligo.org/waveforms/software/pyseobnr) (SEOBNRv5HM for aligned spins,
SEOBNRv5PHM once $\chi_p > 0$, SEOBNRv5EHM once $e > 0$). Rather than storing inertial-frame modes, it stores the
co-precessing modes $(2,2)$, $(2,1)$, $(3,3)$, $(3,2)$, $(4,4)$, $(4,3)$ together with the Euler
angles of the frame rotation. In that frame every amplitude and phase is smooth, so the browser can
interpolate them in $\log q$ and $\chi_{\rm eff}$ and then rotate to the inertial frame with
Wigner $D$-matrices,

$$
h^{\rm I}_{\ell m}(t) = \sum_{m'} D^{\ell}_{m' m}\big(\alpha, \beta, \gamma\big)\, h^{\rm P}_{\ell m'}(t),
\qquad
h_+ - i h_\times = \sum_{\ell m} {}_{-2}Y_{\ell m}(\iota, 0)\, h^{\rm I}_{\ell m} .
$$

The phase alignment at merger is a rigid rotation of the inertial frame — a choice of reference
azimuth — rather than a rotation in the co-precessing frame, which would change the relative phase
between the orbit and the precession. The code lives in the
[`physical-intrep-gw`](https://github.com/BrianCSeymour) toy-analyses repository.

