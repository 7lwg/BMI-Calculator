<!-- # bmi_calculator

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



 -->

# BMI Calculator

## Overview

The BMI Calculator application allows users to calculate their Body Mass Index (BMI) based on their weight and height. It provides users with feedback on their BMI category, which helps in assessing their health status.

## BMI Formula

The Body Mass Index (BMI) is calculated using the following formula:

**BMI = weight (kg) / height (m) ^ 2**

### Parameters:

- **Weight**: Enter your weight in kilograms (kg).
- **Height**: Enter your height in meters (m).
- **Age**: Enter your age.
- **Gender**: Enter your gender.

## BMI Categories for Adults

The Body Mass Index (BMI) ranges for adults are classified as follows:

| BMI Range      | Category      |
| -------------- | ------------- |
| Under 18.5     | Underweight   |
| 18.5 - 24.9    | Normal weight |
| 25.0 - 29.9    | Overweight    |
| 30.0 - 34.9    | Obesity I     |
| 35.0 - 39.9    | Obesity II    |
| 40.0 and above | Obesity III   |

# BMI Classification Tables for Boys and Girls

This document provides the BMI classification tables for boys and girls, categorized by age and weight status.

## Boys BMI Ranges

| Age (Years) | Underweight (< 5th Percentile) | Normal Weight (5th - < 85th Percentile) | Overweight (85th - < 95th Percentile) | Obese (≥ 95th Percentile) |
| ----------- | ------------------------------ | --------------------------------------- | ------------------------------------- | ------------------------- |
| 2           | BMI < 14.8                     | 14.8 ≤ BMI < 18.4                       | 18.4 ≤ BMI < 19.6                     | BMI ≥ 19.6                |
| 3           | BMI < 14.5                     | 14.5 ≤ BMI < 18.0                       | 18.0 ≤ BMI < 19.5                     | BMI ≥ 19.5                |
| 4           | BMI < 14.2                     | 14.2 ≤ BMI < 17.6                       | 17.6 ≤ BMI < 19.1                     | BMI ≥ 19.1                |
| 5           | BMI < 14.0                     | 14.0 ≤ BMI < 17.3                       | 17.3 ≤ BMI < 18.7                     | BMI ≥ 18.7                |
| 6           | BMI < 13.9                     | 13.9 ≤ BMI < 17.1                       | 17.1 ≤ BMI < 18.5                     | BMI ≥ 18.5                |
| 7           | BMI < 14.0                     | 14.0 ≤ BMI < 17.5                       | 17.5 ≤ BMI < 19.0                     | BMI ≥ 19.0                |
| 8           | BMI < 14.1                     | 14.1 ≤ BMI < 17.9                       | 17.9 ≤ BMI < 19.4                     | BMI ≥ 19.4                |
| 9           | BMI < 14.3                     | 14.3 ≤ BMI < 18.3                       | 18.3 ≤ BMI < 19.8                     | BMI ≥ 19.8                |
| 10          | BMI < 14.5                     | 14.5 ≤ BMI < 18.7                       | 18.7 ≤ BMI < 20.2                     | BMI ≥ 20.2                |
| 11          | BMI < 14.7                     | 14.7 ≤ BMI < 19.0                       | 19.0 ≤ BMI < 20.6                     | BMI ≥ 20.6                |
| 12          | BMI < 14.9                     | 14.9 ≤ BMI < 19.4                       | 19.4 ≤ BMI < 21.1                     | BMI ≥ 21.1                |
| 13          | BMI < 15.2                     | 15.2 ≤ BMI < 19.8                       | 19.8 ≤ BMI < 21.6                     | BMI ≥ 21.6                |
| 14          | BMI < 15.6                     | 15.6 ≤ BMI < 20.2                       | 20.2 ≤ BMI < 22.1                     | BMI ≥ 22.1                |
| 15          | BMI < 16.0                     | 16.0 ≤ BMI < 20.6                       | 20.6 ≤ BMI < 22.5                     | BMI ≥ 22.5                |
| 16          | BMI < 16.3                     | 16.3 ≤ BMI < 21.0                       | 21.0 ≤ BMI < 23.0                     | BMI ≥ 23.0                |
| 17          | BMI < 16.5                     | 16.5 ≤ BMI < 21.5                       | 21.5 ≤ BMI < 23.5                     | BMI ≥ 23.5                |
| 18          | BMI < 16.7                     | 16.7 ≤ BMI < 21.9                       | 21.9 ≤ BMI < 24.0                     | BMI ≥ 24.0                |
| 19          | BMI < 17.0                     | 17.0 ≤ BMI < 22.3                       | 22.3 ≤ BMI < 24.6                     | BMI ≥ 24.6                |

## Girls BMI Ranges

| Age (Years) | Underweight (< 5th Percentile) | Normal Weight (5th - < 85th Percentile) | Overweight (85th - < 95th Percentile) | Obese (≥ 95th Percentile) |
| ----------- | ------------------------------ | --------------------------------------- | ------------------------------------- | ------------------------- |
| 2           | BMI < 14.8                     | 14.8 ≤ BMI < 18.5                       | 18.5 ≤ BMI < 19.7                     | BMI ≥ 19.7                |
| 3           | BMI < 14.5                     | 14.5 ≤ BMI < 18.2                       | 18.2 ≤ BMI < 19.3                     | BMI ≥ 19.3                |
| 4           | BMI < 14.3                     | 14.3 ≤ BMI < 18.0                       | 18.0 ≤ BMI < 19.1                     | BMI ≥ 19.1                |
| 5           | BMI < 14.1                     | 14.1 ≤ BMI < 17.5                       | 17.5 ≤ BMI < 18.5                     | BMI ≥ 18.5                |
| 6           | BMI < 14.0                     | 14.0 ≤ BMI < 17.1                       | 17.1 ≤ BMI < 18.3                     | BMI ≥ 18.3                |
| 7           | BMI < 14.1                     | 14.1 ≤ BMI < 17.5                       | 17.5 ≤ BMI < 19.0                     | BMI ≥ 19.0                |
| 8           | BMI < 14.2                     | 14.2 ≤ BMI < 17.8                       | 17.8 ≤ BMI < 19.5                     | BMI ≥ 19.5                |
| 9           | BMI < 14.4                     | 14.4 ≤ BMI < 18.1                       | 18.1 ≤ BMI < 19.8                     | BMI ≥ 19.8                |
| 10          | BMI < 14.6                     | 14.6 ≤ BMI < 18.5                       | 18.5 ≤ BMI < 20.3                     | BMI ≥ 20.3                |
| 11          | BMI < 14.8                     | 14.8 ≤ BMI < 18.9                       | 18.9 ≤ BMI < 20.7                     | BMI ≥ 20.7                |
| 12          | BMI < 15.0                     | 15.0 ≤ BMI < 19.3                       | 19.3 ≤ BMI < 21.1                     | BMI ≥ 21.1                |
| 13          | BMI < 15.2                     | 15.2 ≤ BMI < 19.7                       | 19.7 ≤ BMI < 21.6                     | BMI ≥ 21.6                |
| 14          | BMI < 15.5                     | 15.5 ≤ BMI < 20.1                       | 20.1 ≤ BMI < 22.0                     | BMI ≥ 22.0                |
| 15          | BMI < 15.8                     | 15.8 ≤ BMI < 20.5                       | 20.5 ≤ BMI < 22.5                     | BMI ≥ 22.5                |
| 16          | BMI < 16.0                     | 16.0 ≤ BMI < 21.0                       | 21.0 ≤ BMI < 23.1                     | BMI ≥ 23.1                |
| 17          | BMI < 16.2                     | 16.2 ≤ BMI < 21.4                       | 21.4 ≤ BMI < 23.5                     | BMI ≥ 23.5                |
| 18          | BMI < 16.4                     | 16.4 ≤ BMI < 21.8                       | 21.8 ≤ BMI < 24.0                     | BMI ≥ 24.0                |
| 19          | BMI < 16.7                     | 16.7 ≤ BMI < 22.3                       | 22.3 ≤ BMI < 24.6                     | BMI ≥ 24.6                |

## How to Use

1. Enter your weight and height.
2. If applicable, enter your age and gender.
3. Click the "Calculate" button.
4. The BMI will be displayed, along with the corresponding weight category.

## Acknowledgements

- The BMI categories and calculations are based on standard health guidelines.
