county_data <- read.csv("/Users/ana/Desktop/covid/texas/county_level_data.csv", colClasses=c('numeric','character','numeric','numeric','numeric','numeric','numeric','numeric',
                                                                                                        'numeric','numeric','numeric','character','numeric','numeric','numeric','numeric'))

hist(county_data$Sentiment)  #normal
hist((county_data$Weighted_HL)) #okay
hist((county_data$SVI))
hist((county_data$Population))
hist(log(county_data$total_doses))

barplot(county_data$SVI,names.arg = county_data$County,  las=2, cex.names=.7)

abline(lm(county_data$Weighted_HL ~ county_data$SVI))
plot(log(county_data$total_doses), county_data$SVI)

abline(lm(county_data$vaccinated ~ county_data$Sentiment))
plot(county_data$Sentiment,county_data$vaccinated, xlab='Sentiment', ylab='Vaccinated')

hist(log(county_data$total_doses))
formula =  total_doses ~ SVI
summary (m1<-lm(formula, data = county_data))

formula =  SVI ~ Weighted_HL
summary (m1<-lm(formula, data = county_data))

# Call:
#   lm(formula = formula, data = county_data)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.48374 -0.10349  0.00806  0.11658  0.26732 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  4.700567   0.668390   7.033 6.76e-08 ***
#   Weighted_HL -0.017049   0.002775  -6.143 8.17e-07 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.1784 on 31 degrees of freedom
# Multiple R-squared:  0.549,	Adjusted R-squared:  0.5345 
# F-statistic: 37.74 on 1 and 31 DF,  p-value: 8.167e-07

formula =  SVI ~ White_pop + Black_pop + Hispanic_pop + Asian_pop
summary (m1<-lm(formula, data = county_data))

# Call:
#   lm(formula = formula, data = county_data)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.25843 -0.07331 -0.01459  0.05469  0.34065 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   -0.2110     0.3792  -0.556  0.58239    
# White_pop      0.3629     0.4056   0.895  0.37850    
# Black_pop      2.4100     0.5270   4.573 8.90e-05 ***
#   Hispanic_pop   0.9508     0.1260   7.546 3.21e-08 ***
#   Asian_pop     -1.9976     0.7141  -2.797  0.00921 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.1364 on 28 degrees of freedom
# Multiple R-squared:  0.7618,	Adjusted R-squared:  0.7278 
# F-statistic: 22.39 on 4 and 28 DF,  p-value: 2.207e-08

formula =  Weighted_HL ~ White_pop + Black_pop + Hispanic_pop + Asian_pop
summary (m1<-lm(formula, data = county_data))

# Call:
#   lm(formula = formula, data = county_data)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -12.102  -3.449   0.048   2.796   9.914 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   217.578     12.838  16.948 2.97e-16 ***
#   White_pop      48.414     13.730   3.526  0.00147 ** 
#   Black_pop       1.853     17.840   0.104  0.91801    
# Hispanic_pop  -46.727      4.265 -10.955 1.24e-11 ***
#   Asian_pop      81.284     24.174   3.362  0.00225 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4.618 on 28 degrees of freedom
# Multiple R-squared:  0.8555,	Adjusted R-squared:  0.8348 
# F-statistic: 41.44 on 4 and 28 DF,  p-value: 2.248e-11

hist(county_data$Sentiment)
hist((county_data$total_doses))
# missing unique users
formula = total_doses ~ Sentiment + Weighted_HL + SVI + Population  + Total + White_pop + Black_pop + Hispanic_pop + Asian_pop
summary (m1<-glm.nb(formula, data = county_data, family='poisson'))
# Call:
#   glm(formula = formula, family = "poisson", data = county_data)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -484.63  -206.04   -61.71   102.14   761.65  
# 
# Coefficients:
#   Estimate       Std. Error z value            Pr(>|z|)    
# (Intercept)  -8.0745957785585  0.0286759355756  -281.6 <0.0000000000000002 ***
#   Sentiment     2.5438678321336  0.0102517543485   248.1 <0.0000000000000002 ***
#   Weighted_HL   0.0780162261544  0.0001062934174   734.0 <0.0000000000000002 ***
#   SVI          -0.4385479156725  0.0032111485442  -136.6 <0.0000000000000002 ***
#   Population    0.0000003680928  0.0000000004911   749.5 <0.0000000000000002 ***
#   Total         0.0002246957215  0.0000005259818   427.2 <0.0000000000000002 ***
#   White_pop    -1.7477923573575  0.0079644528786  -219.4 <0.0000000000000002 ***
#   Black_pop     2.6373915755664  0.0129152060161   204.2 <0.0000000000000002 ***
#   Hispanic_pop  6.0927519645554  0.0063210204518   963.9 <0.0000000000000002 ***
#   Asian_pop     5.0380210302025  0.0112842075578   446.5 <0.0000000000000002 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 19600581  on 32  degrees of freedom
# Residual deviance:  2042998  on 23  degrees of freedom
# AIC: 2043488
# 
# Number of Fisher Scoring iterations: 6


###################### data averaged per user per week
data2 <- read.csv("/Users/ana/Desktop/covid/texas/user_averaged_week.csv",colClasses=c('numeric','character', 'character', 'numeric', 'numeric','numeric','numeric','numeric'
                                                                                       ,'numeric',
                                                                                       'numeric','numeric','numeric','numeric','numeric','numeric','numeric',
                                                                                       'numeric','numeric','numeric','numeric','numeric'))
hist(data2$vaccinated)
hist(data2$total_doses)
hist(data2$one_dose)

library(multiwayvcov)
library("lmtest")

options(scipen=999)
formula = vaccinated  ~ Sentiment + Weighted_HL + SVI + Population + White_pop + Black_pop + Hispanic_pop + Asian_pop + Unique_users + Total
model1= glm(formula = formula, data= data2, family='poisson')
vcov1= cluster.vcov(model1, ~data2$County + data2$Week)
coeftest(model1, vcov1)
summary(model1)
# Call:
#   glm(formula = formula, family = "poisson", data = data2)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -973.99  -301.58   -68.47   183.61  1137.45  
# 
# Coefficients:
#   Estimate         Std. Error z value            Pr(>|z|)    
# (Intercept)  -17.17101173932153   0.00380135609379 -4517.1 <0.0000000000000002 ***
#   Sentiment     -0.03091312451611   0.00003860288174  -800.8 <0.0000000000000002 ***
#   Weighted_HL    0.13087124020009   0.00001418477879  9226.2 <0.0000000000000002 ***
#   SVI           -1.23998676422851   0.00058556256331 -2117.6 <0.0000000000000002 ***
#   Population     0.00000065467139   0.00000000008897  7358.7 <0.0000000000000002 ***
#   White_pop     -7.69456911399002   0.00156768911275 -4908.2 <0.0000000000000002 ***
#   Black_pop      2.11163116715282   0.00228629461440   923.6 <0.0000000000000002 ***
#   Hispanic_pop   8.26035636821246   0.00101569218298  8132.7 <0.0000000000000002 ***
#   Asian_pop     -7.13943641815151   0.00188813031071 -3781.2 <0.0000000000000002 ***
#   Unique_users  -0.00327951879116   0.00000078410551 -4182.5 <0.0000000000000002 ***
#   Total          0.00123993990595   0.00000028905017  4289.7 <0.0000000000000002 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 4687461214  on 15563  degrees of freedom
# Residual deviance: 2500572783  on 15553  degrees of freedom
# AIC: 2500770078


############ county weekly average #########
data20 <- read.csv("/Users/ana/Desktop/covid/texas/county_averaged_week_v2.csv", colClasses=c('numeric','character','factor','numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric',
                                                                                            'numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric',
                                                                                          'numeric'))

##############################
hist(data20$vaccinated)
hist(data20$one_dose)
hist(log(data20$total_doses))
hist(data20$Sentiment)
hist(data20$Weighted_HL)
hist(data20$SVI)
hist(data20$Total)

length(unique(data20$County))  # 33
library(MASS)
options(scipen=999)

test <- data20[ ! data20$County %in% to_remove, ]
length(unique(test$County))  # 33
formula = total_doses~ Sentiment + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop  + Total_y
model1= glm(formula = formula, data=data20,family='poisson')
vcov1= cluster.vcov(model1, ~test$County)
coeftest(model1, vcov1)
summary(model1)

############################################################  because ditribution not normal
formula = total_doses~ Sentiment + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop  + Total_y
model1= glm(formula = formula, data= data20,family='poisson')
vcov1= cluster.vcov(model1, ~data20$County)
coeftest(model1, vcov1)
summary(model1)
########################################################################
#   glm(formula = formula, family = "poisson", data = data20)
# 
# Deviance Residuals: 
#   Min        1Q    Median        3Q       Max  
# -1220.03   -326.71   -152.19     83.12   3130.33  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -1.228e+01  9.951e-03 -1234.1   <2e-16 ***
#   Sentiment    -4.934e-02  4.882e-04  -101.1   <2e-16 ***
#   Weighted_HL   8.449e-02  3.673e-05  2300.3   <2e-16 ***
#   SVI          -4.375e-01  1.040e-03  -420.6   <2e-16 ***
#   Black_pop     8.794e+00  3.155e-03  2787.3   <2e-16 ***
#   Hispanic_pop  7.176e+00  2.179e-03  3292.9   <2e-16 ***
#   Asian_pop     6.615e+00  3.032e-03  2181.9   <2e-16 ***
#   Total_y       6.587e-03  9.897e-07  6655.8   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 242370401  on 604  degrees of freedom
# Residual deviance: 130795985  on 597  degrees of freedom
# AIC: 130803925
# 
# Number of Fisher Scoring iterations: 6

############ facebook English county weekly average
data_fb <- read.csv("/Users/ana/Desktop/covid/texas/fb_en_county_weekly_averaged.csv", colClasses=c('numeric','character','factor','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric',
                                                                                                    'numeric','numeric','numeric','numeric','numeric','numeric','numeric','character','numeric',
                                                                                           'numeric','character','numeric','numeric','numeric','numeric','numeric',
                                                                                           'numeric','numeric','numeric','numeric','numeric'
                                                                                           ))
hist(data_fb$vaccinated)
hist(data_fb$one_dose)
hist(log(data_fb$total_doses))
hist(data_fb$Sentiment)
hist(data_fb$Weighted_HL)
hist(data_fb$SVI)
hist(data_fb$Total)
sum(data_fb$Total)
library(multiwayvcov)
library("lmtest")

library(MASS)
options(scipen=999)

length(unique(data_fb$County))  # 32
unique <-data_fb[!duplicated(data_fb$County), ]
hist(unique$SVI)
plot(unique$Weighted_HL,unique$SVI)
hist(data_fb$Sentiment)
hist(data_fb$Total) 

test <- data_fb[ ! data_fb$County %in% to_remove, ]
length(unique(test$County))  # 22
formula = total_doses~ Sentiment + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop  + Total
model1= glm(formula = formula, data=test,family='poisson')
vcov1= cluster.vcov(model1, ~test$County)
coeftest(model1, vcov1)
summary(model1)

formula = total_doses~ Sentiment + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop + Total
model1= glm(formula = formula, data= data_fb, family='poisson')
vcov1= cluster.vcov(model1, ~data_fb$County)
coeftest(model1, vcov1)
summary(model1)
sum(data_fb$Total)
# Call:
#   glm(formula = formula, family = "poisson", data = data_fb)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1239.4   -350.5   -147.9    119.3   2794.9  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -5.426e+00  1.217e-02  -445.9   <2e-16 ***
#   Sentiment     3.176e+00  1.140e-03  2786.3   <2e-16 ***
#   Weighted_HL   5.413e-02  4.474e-05  1209.8   <2e-16 ***
#   SVI          -7.665e-01  1.021e-03  -751.0   <2e-16 ***
#   Black_pop     8.732e+00  3.412e-03  2559.3   <2e-16 ***
#   Hispanic_pop  5.884e+00  2.545e-03  2311.9   <2e-16 ***
#   Asian_pop     5.860e+00  2.915e-03  2010.4   <2e-16 ***
#   Total         2.627e-03  5.027e-07  5226.6   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 237727323  on 607  degrees of freedom
# Residual deviance: 134233186  on 600  degrees of freedom
# AIC: 134241250
# 
# Number of Fisher Scoring iterations: 6

############## Spanish Twitter data 
spanish_data <- read.csv("/Users/ana/Desktop/covid/texas/spanish_twitter_county_weekly_averaged.csv", colClasses=c('numeric','character','factor','numeric','numeric','numeric','numeric','character',
                                                                                             'numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
to_remove <- unique(spanish_data$County)
length(unique(spanish_data$County))  # 11
hist(spanish_data$NEG)
hist(spanish_data$POS)
hist(spanish_data$NEU)
hist(spanish_data$Total)
hist(log(spanish_data$total_doses))

unique2 <-spanish_data[!duplicated(spanish_data$County), ]
hist(unique2$SVI)
plot(unique2$Weighted_HL,unique2$SVI)

formula = total_doses ~ NEG + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop + Total
model1= glm(formula = formula, data= spanish_data, family='poisson')
vcov1= cluster.vcov(model1, ~spanish_data$County)
coeftest(model1, vcov1)
summary(model1)
# glm(formula = formula, family = "poisson", data = spanish_data)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1438.6   -498.6   -132.2    161.4   1847.7  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -1.985e+01  1.940e-02 -1023.4   <2e-16 ***
#   NEG          -7.531e-01  4.361e-04 -1726.9   <2e-16 ***
#   Weighted_HL   1.190e-01  7.181e-05  1656.6   <2e-16 ***
#   SVI           4.717e+00  3.980e-03  1185.0   <2e-16 ***
#   Black_pop     6.290e+00  9.605e-03   654.9   <2e-16 ***
#   Hispanic_pop  2.093e+00  6.677e-03   313.5   <2e-16 ***
#   Asian_pop     5.620e+00  8.465e-03   663.9   <2e-16 ***
#   Total         5.780e-03  1.255e-05   460.5   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 102407384  on 149  degrees of freedom
# Residual deviance:  58534018  on 142  degrees of freedom
# AIC: 58536090
# 
# Number of Fisher Scoring iterations: 8
# 

formula = total_doses ~ POS + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop + Total
model1= glm(formula = formula, data= spanish_data, family='poisson')
vcov1= cluster.vcov(model1, ~spanish_data$County)
coeftest(model1, vcov1)
summary(model1)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1318.4   -504.6   -121.6    246.6   1910.2  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -2.092e+01  2.073e-02 -1009.0   <2e-16 ***
#   POS           1.822e+00  8.283e-04  2199.5   <2e-16 ***
#   Weighted_HL   1.196e-01  7.669e-05  1560.1   <2e-16 ***
#   SVI           6.089e+00  4.218e-03  1443.7   <2e-16 ***
#   Black_pop     4.764e+00  1.023e-02   465.6   <2e-16 ***
#   Hispanic_pop  1.106e+00  7.143e-03   154.8   <2e-16 ***
#   Asian_pop     8.863e+00  8.966e-03   988.6   <2e-16 ***
#   Total         3.264e-03  1.270e-05   256.9   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 102407384  on 149  degrees of freedom
# Residual deviance:  57482151  on 142  degrees of freedom
# AIC: 57484223
# 
# Number of Fisher Scoring iterations: 7


############## Spanish Facebook data

spanish_fb <- read.csv("/Users/ana/Desktop/covid/texas/spanish_facebook_county_weekly_averaged.csv", colClasses=c('numeric','character','factor','numeric','numeric','numeric','numeric','character',
                                                                                                                   'numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


hist(spanish_fb$NEG)
hist(spanish_fb$POS)
hist(spanish_fb$NEU)
hist(spanish_fb$Total)
hist(log(spanish_fb$total_doses))
sum(spanish_fb$Total)  # 38636

length(unique(spanish_fb$County))  # 25

test <- spanish_fb[ ! spanish_fb$County %in% to_remove, ]
length(unique(test$County))  # 22
formula = total_doses~ NEG + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop  + Total
model1= glm(formula = formula, data=test,family='poisson')
vcov1= cluster.vcov(model1, ~test$County)
coeftest(model1, vcov1)
summary(model1)

formula = total_doses ~ NEG + Weighted_HL + SVI + Black_pop + Hispanic_pop + Asian_pop + Total
model1= glm(formula = formula, data= spanish_fb, family='poisson')
vcov1= cluster.vcov(model1, ~spanish_fb$County)
coeftest(model1, vcov1)
summary(model1)
# Call:
#   glm(formula = formula, family = "poisson", data = spanish_fb)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1326.8   -423.4   -140.1    156.3   2189.6  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -2.804e+01  1.788e-02 -1568.1   <2e-16 ***
#   NEG          -3.350e+00  1.448e-03 -2313.1   <2e-16 ***
#   Weighted_HL   1.404e-01  6.499e-05  2159.7   <2e-16 ***
#   SVI          -1.279e+00  1.411e-03  -906.6   <2e-16 ***
#   Black_pop     1.862e+01  4.888e-03  3809.1   <2e-16 ***
#   Hispanic_pop  1.225e+01  3.854e-03  3178.9   <2e-16 ***
#   Asian_pop     1.229e+01  4.702e-03  2614.0   <2e-16 ***
#   Total         1.950e-03  1.106e-06  1763.2   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 185236962  on 388  degrees of freedom
# Residual deviance: 109449826  on 381  degrees of freedom
# (57 observations deleted due to missingness)
# AIC: 109455080
# 
# Number of Fisher Scoring iterations: 6

formula = total_doses ~ POS + Weighted_HL + SVI  + Black_pop + Hispanic_pop + Asian_pop + Total
model1= glm(formula = formula, data= spanish_fb, family='poisson')
vcov1= cluster.vcov(model1, ~spanish_fb$County)
coeftest(model1, vcov1)
summary(model1)

# Call:
#   glm(formula = formula, family = "poisson", data = spanish_fb)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1178.4   -439.6   -136.9    146.9   2378.9  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)  -3.381e+01  1.793e-02 -1885.5   <2e-16 ***
#   POS           2.045e+00  1.070e-03  1911.7   <2e-16 ***
#   Weighted_HL   1.599e-01  6.520e-05  2451.8   <2e-16 ***
#   SVI          -1.034e+00  1.383e-03  -747.6   <2e-16 ***
#   Black_pop     1.891e+01  4.957e-03  3815.7   <2e-16 ***
#   Hispanic_pop  1.279e+01  3.881e-03  3295.5   <2e-16 ***
#   Asian_pop     1.276e+01  4.584e-03  2783.5   <2e-16 ***
#   Total         1.860e-03  1.097e-06  1694.6   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for poisson family taken to be 1)
# 
# Null deviance: 185236962  on 388  degrees of freedom
# Residual deviance: 112439485  on 381  degrees of freedom
# (57 observations deleted due to missingness)
# AIC: 112444738
# 
# Number of Fisher Scoring iterations: 6



