# Applying Multiple Regression to Predict ULTA’s Closing Stock Price Using Adjacent Stocks in Consumer Discretionary Components in the S&P 500

**John I. Anderies, April 2024**

## Abstract

This report aims to use multiple regression to predict Ulta Corporation's closing stock price using the closing stock price of other companies in the consumer discretionary components list from the S&P 500. For the development of the model, SAS was used supplemented with Tableau for visualizations. The first step of this analysis was to use stepwise regression on different stocks from companies that were considered to have a similar consumer base as Ulta and therefore might help predict the stock price. These stocks are as follows: Amazon, Bath & Body Works, Etsy, Expedia Group, Lululemon, Marriott International, MGM Resorts, Nike, Pool Corporation, Ralph Lauren Corporation, Starbucks, Tapestry, Inc., Wynn Resorts, Ross Stores, Royal Caribbean, and Yum! Brands. Stepwise regression was then applied to these variables and returned the first-order model with the highest R-squared. The model included these variables; Bath and Body Works, Amazon, Etsy, Lululemon, Marriott, Nike, Ralph Lauren, Tapestry, Wynn Resorts, and Yum Brands.

The next step in the regression process was to check for multicollinearity. This was done using the Variance Inflation Factor (VIF) of all independent variables. Models were tested by removing high VIF variables and then re-running the model to see if the removed variable was the cause of the inflation. The final model that had VIF values all below the desired cut-off of 10 was: Bath and Body Works, Etsy, Lululemon, MGM, Nike, Ralph Lauren, Wynn Resorts, and Yum Brands. 

The next step was to add second-order terms, with all 10 original variables being tested as second-order terms. This test was done through an F-test of the second-order terms. The F-test came back significant meaning that at least one of the second-order coefficients was significant. All t-tests for second-order terms were examined and three were found to be insignificant: Ralph Lauren, Lululemon, and Yum! These terms were removed and the model's performance did not change. The next step was to look at interaction terms, with Lululemon and Nike, as well as MGM and Wynn Resorts being selected as two interaction terms given they cover very similar markets. These terms were tested with interaction plots. When added to the model, they increased the R-squared adjusted and both had significant t-tests. These terms were added to the final model giving the following:

$\[E(Ulta) = -992.65411 + 26.25259(\text{BBWI}) + 3.44117(\text{LULU}) + 28.82128(\text{MGM}) - 5.79296(\text{NKE}) + 1.60998(\text{RL}) - 9.22255(\text{WYNN}) + 0.58940(\text{YUM}) - 0.332676(\text{BBWI}^2) + 0.58108(\text{MGM}^2) + 0.09340(\text{NKE}^2) + 0.22493(\text{WYNN}^2) - 0.03203(\text{LULU}*\text{NKE}) - 0.80242(\text{MGM}*\text{WYNN})\$

Residual analysis was then done to ensure that the assumptions of equal variances and normality hold true. The residual versus predicted, fit-mean, Cook's D, and histogram of the residuals all showed the expected behaviors that support these assumptions which are necessary for regression validity. The overall R-squared adjusted was 0.91, which means that 91% of the variation in Ulta’s stock price was accounted for by the model. All metrics of performance were met, meaning that this model is performing well and is trustworthy.

The next steps for this model would be to explore all of the relevant interaction terms and incorporate them into the model to see what effect they might have on improving the overall performance. Once this is checked, more stocks that relate to Ulta’s consumer base outside of the Consumer Discretionary Components could be brought in to see if they help with predictions.

## Exploratory Data Analysis

There are 52 stocks in this dataset from the Consumer Discretionary Components in the S&P 500. I selected Ulta, which is a cosmetic retail chain that specializes in beauty products. I thought it would be interesting to explore what other stocks are linked to the performance of Ulta stock as it seems like a fairly stable market that doesn't have much competition outside of large retailers that don’t necessarily specialize in beauty products. While there are 51 other variables that I could have chosen for this analysis, I chose to look at stocks of companies that are related to either retail or lifestyle and fashion as it would seem that these cover the same market and therefore would be useful in predicting Ulta’s stock price. I also threw in Starbucks as every time I have been to an Ulta I have seen a vast majority of people in the store drinking Starbucks so maybe there is a connection through the type of consumers for both companies.

The stocks that I selected are as follows: Amazon, Bath & Body Works, Inc., Etsy, Expedia Group, Lululemon Athletica, Marriott International, MGM Resorts, Nike, Inc., Pool Corporation, Ralph Lauren Corporation, Starbucks, Tapestry, Inc., Wynn Resorts, Ross Stores, Royal Caribbean, and Yum! Brands. All of these companies fall into either entertainment, fashion, luxury, or lifestyle which are all adjacent to the products that Ulta sells.

Firstly, let's look at the trends of all of the stocks over the given timeframe. We can see in Fig 1.1 the closing prices of each day from April 2023 to March 2024. The stocks that are in Fig 1.1 are Ulta, Bath and Body Works, Etsy, and Amazon. We can see that for all stocks except Amazon, there is a distinct drop around early November. This drop is seen in Amazon, but it is much less significant when compared to the other three stocks.
