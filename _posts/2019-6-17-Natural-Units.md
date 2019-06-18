---
layout: posts
title:  "Automated Natural Unit Conversions in Mathematica"
usemathjax: true
---

### Introduction and Review
Natural units are a way to simplify repetitive fundamental constants in theoretical physics equations. In my research, I used three particular unit systems: geometric ($c=G=1$), natural ($c=\hbar=1$), and Planck units ($c=\hbar=G=1$). However, for me it is time consuming to convert to and from natural units. I decided that I would write an extension to Mathematica's units package to remedy this.

A great summary of natural units goes in more detail in an excellent document [here](https://www.seas.upenn.edu/~amyers/NaturalUnits.pdf). Given a SI quantity $Q_{\text{SI}}$, the quantity in natural units is given by $Q_{\text{geometric}} = Q_{\text{SI}}/A$ for some factor $A$. For the rest of this post, I will use geometric units. Suppose that the quantity has SI units of the form

$$[Q_{\text{SI}}] = M^\alpha \times L^\beta \times T^\gamma \, ,$$

then, one can find $Q_{\text{geometric}}$ with the following factor

$$A = G^{-\alpha} c^{2\alpha-\gamma} \, .$$

So all we need to do to convert between the units is to find $A$.

### Mathmatica Implementation

The first thing that we need to do is write a helper function that will return the $\alpha$, $\beta$, and $\gamma$ from our previous equation. All I need to do was write a wrapper class for the UnitDimensions[] fuction that Mathematica has.

{% highlight mathematica %}
GetUnitVal[qu_, unit_] := Module[{result, dims},
  dims = UnitDimensions[qu];
  If[Position[dims, unit] == {}, result = 0,
    result = dims[[Position[dims, unit][[1, 1]], 2]]];
  result
]
{% endhighlight %}

Next, I wrote a function to calculate the constant $A$.

{% highlight mathematica %}
SItoGeometricDivideFactor[qu_] := Module[{\[Alpha], \[Beta], \[Gamma]},
  \[Alpha] = GetUnitVal[qu, "MassUnit"]; \[Beta] =
   GetUnitVal[qu, "LengthUnit"]; \[Gamma] = GetUnitVal[qu, "TimeUnit"];
   Quantity[1, "GravitationalConstant"]^-\[Alpha]*
   Quantity[1, "SpeedOfLight"]^(2 \[Alpha] - \[Gamma])
]
{% endhighlight %}

Finally, I used a function that will find $Q_{\text{geometric}}$ by dividing $Q_{\text{SI}}$ by $A$. Afterwards, it converts the result into meters to the $n$ power as is used in geometric units.

{% highlight mathematica %}
SItoGeometricUnits[qu_] := Module[{factor, geoqu},
  factor = SItoGeometricDivideFactor[qu]; geoqu = qu/factor;
   UnitConvert[geoqu, ("Meters")^GetUnitVal[geoqu, "LengthUnit"]]
]
{% endhighlight %}

The full version of these functions which includes geometric, natural, and Planck units is [publicly available](https://github.com/BrianCSeymour/natural-units-mathematica-conversion) on my Github. Feel free to use it and I hope that it will save you time in your research!
