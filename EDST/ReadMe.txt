# EDST: Enhanced MATLAB Framework for Dempster-Shafer Theory (DST)

## Overview
This repository hosts an improved MATLAB framework designed for Dempster-Shafer Theory (DST), a powerful mathematical tool for reasoning under uncertainty. The framework encompasses a collection of combination rules and utility functions tailored for performing evidence fusion and manipulation of cardinality-aware rules.

## Directory Structure

1. **DST**: This directory holds the original DST framework developed by Arnoud Martin (http://people.irisa.fr/Arnaud.Martin/toolboxes/).
2. **Examples**:
   - **Working Example**: This example guides users through the computation of Focal_Matrix and Conflict_Matrix, offering instructions for combining evidence using both old and new implementations of the PCR6 combination rule.
   - **Example 1**: Demonstrates evidence combination in the context of the Zadeh paradox, employing old combination rules (Smets, DS, and PCR6) and the newly optimized PCR6 rule (PCR6_Optimized).
   - **Example 2**: Reproduces the findings presented in Table 1 and Figure 3 of the paper, comparing the computational complexity of the original PCR6 implementation with the optimized version across varying frame of discernment sizes.
   - **Example 3**: Replicates the results showcased in Figure 4 of the paper, illustrating the computational complexity comparison between the original PCR6 implementation and the optimized version for varying numbers of sources.
   - **Example 4**: Offers practical instances for combining evidence using recently introduced cardinality-aware combination rules such as JPCR6, ZPCR6, SJPCR6, SZPCR6, and CBF.
3. **Cardinality-Aware Functions**: This directory contains specialized utility functions for computing the cardinality of focal elements, intersections, unions, and products of focal elements.
4. **Basic DST Functions**: Comprises general-purpose utility functions utilized by the combination rules.
5. **Combination Rules**: Includes both traditional DST combination rules and newly developed rules like the optimized PCR6 rule and its variants (JPCR6, ZPCR6, SJPCR6, SZPCR6), JCR rule, ZCR rule, and CBF rule.

## Usage
- Explore the examples provided in the "Examples" directory to gain insights into utilizing the framework and combination rules.
- Utilize the functions within the "Cardinality-Aware Functions" directory to calculate cardinalities for evidence fusion.
- Apply the combination rules available in the "Combination Rules" directory based on specific evidence fusion requirements.
