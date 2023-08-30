spanish_facebook <- read.csv("analyis_file.csv")

hist(spanish_facebook$Anger)
hist(log(spanish_facebook$Difference))
shapiro.test(spanish_facebook$Difference)

# cluster per both county and week
library(multiwayvcov)
library("lmtest")
library("nortest")

formula = Difference ~ NEG  + Weighted_HL+ SVI+ Hispanic_pop + Black_pop + Asian_pop
model1= lm(formula = formula, data= spanish_facebook)
vcov1= cluster.vcov(model1, ~ County+ Week)
coeftest(model1, vcov1)
# Estimate Std. Error t value Pr(>|t|)  
# (Intercept)  -240357.59  978523.54 -0.2456  0.80597  
# NEG            -5552.98    2228.39 -2.4919  0.01271 *
#   Weighted_HL      768.19    3578.13  0.2147  0.83001  
# SVI            -1902.99   90091.50 -0.0211  0.98315  
# Hispanic_pop  103565.74  216499.41  0.4784  0.63239  
# Black_pop     622821.87  328903.21  1.8936  0.05829 .
# Asian_pop     -61849.82  563043.91 -0.1098  0.91253  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

formula = Difference ~ Fear  + Weighted_HL+ SVI+ Hispanic_pop + Black_pop + Asian_pop
model1= lm(formula = formula, data= spanish_facebook)
vcov1= cluster.vcov(model1, ~ County+ Week)
coeftest(model1, vcov1)
# t test of coefficients:
#   
#   Estimate Std. Error t value  Pr(>|t|)    
# (Intercept)  -237590.54  974289.32 -0.2439 0.8073410    
# Fear         -112303.83   33655.89 -3.3368 0.0008486 ***
#   Weighted_HL      758.37    3562.77  0.2129 0.8314380    
# SVI            -1066.09   90069.23 -0.0118 0.9905563    
# Hispanic_pop  102014.19  215582.03  0.4732 0.6360720    
# Black_pop     619033.07  327611.85  1.8895 0.0588320 .  
# Asian_pop     -57806.59  563194.91 -0.1026 0.9182491    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1



