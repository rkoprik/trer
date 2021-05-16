This repository was built based on the ['trer' template for reproducible emprical research](https://github.com/trr266/trer).

## Build On Theory

This repository provides lecture material for a Bachelor course level about Unraveling Theory. It contains a beamer pdf that can be used in the class and a handout pdf that students can use to read before/after class. Aside from the theoretical part, it contains real life examples (Tesla and SpaceX).


### Where do I start?

- `code`: This directory is empty as no code was used for this output.

- `data`: This directory is empty as no data was used for this output.

- `media`: This directory contains all the figures used in the examples mentioned.

- `doc`: Here you will find two RMarkdown files containing text and program instructions that will become our paper and presentation, by rendering them through the R markdown process and LaTeX.

You also see an `output` directory but it is empty. Why? Because you will create the output locally on your computer, if you want.


### How do I create the output?

Assuming that you have RStudio and make/Rtools installed, this should be relatively straightforward.

1. Download, clone or fork the repository to your local computing environment.
2. Before building everything you most likely need to install additional packages. This repository follows the established principle not to install any packages automatically. This is your computing environment. You decide what you want to install. See the code below for installing the packages.
4. Run 'make all' either via the console or by identifying the 'Build All' button in the 'Build' tab (normally in the upper right quadrant of the RStudio screen). 
5. Eventually, you will be greeted with the two files in the output directory: "paper.pdf" and "presentation.pdf". Congratulations! You have successfully used an open science resource and reproduced our "analysis". Now modify it and make it your own project!

If you do not see 'Build' tab this is most likely because you do not have 'make' installed on your system. 
  - For Windows: Install Rtools: https://cran.r-project.org/bin/windows/Rtools/
  - For MacOS: You need to install the Mac OS developer tools. Open a terminal and run `xcode-select --install` Follow the instructions
  - On Linux: I have never seen a Unix environment without 'make'. 

```
# Code to install packages to your system
install_package_if_missing <- function(pkg) {
  if (! pkg %in% installed.packages()[, "Package"]) install.packages(pkg)
}
install_package_if_missing("tidyverse")
install_package_if_missing("wbstats")
install_package_if_missing("lubridate")
install_package_if_missing("ExPanDaR")
install_package_if_missing("knitr")
install_package_if_missing("kableExtra")
install_package_if_missing("rmarkdown")

# In addition, if you have no working LaTeX environment, consider
# installing the neat tinytex LateX distribution. It is lightweight and
# you can install it from wihtin R! See https://yihui.org/tinytex/
# To install it, run from the R console:

install_package_if_missing('tinytex')
tinytex::install_tinytex()

# That's all!
```

### Licensing

This repository is licensed to you under the MIT license, essentially meaning that you can do whatever you want with it as long as you give credit to us when you use substantial portions of it. What 'substantial' means is not trivial for a template. Here is our understanding. If you 'only' use the workflow, the structure and let's say parts of the Makefile and/or the README sections that describe these aspects, we do not consider this as 'substantial' and you do not need to credit us. If, however, you decide to reuse a significant part of the example code, for example the code pulling World Bank data, maybe giving credit could be appropriate.

In any case, we would love to see you spreading the word by adding a statement like 

```
This repository was built based on the ['trer' template for reproducible emprical research](https://github.com/trr266/trer).
```

to your README file. But this is not a legal requirement but a favor that we ask 😉.


### References

These are some very helpful texts discussing collaborative workflows for scientific computing:

- Christensen, Freese and Miguel (2019): Transparent and Reproducible Social Science Research, Chapter 11: https://www.ucpress.edu/book/9780520296954/transparent-and-reproducible-social-science-research
- Gentzkow and Shapiro (2014): Code and data for the social sciences:
a practitioner’s guide, https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf
- Wilson, Bryan, Cranston, Kitzes, Nederbragt and Teal (2017): Good enough practices in scientific computing, PLOS Computational Biology 13(6): 1-20, https://doi.org/10.1371/journal.pcbi.1005510


