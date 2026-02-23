library(ggplot2)
library(dplyr)

raw <- read.csv('times.csv',header=TRUE)
data <- dplyr::tibble(raw)
data <- mutate(data,tsquared=t_s^2)

fig <- ggplot(data)+
    geom_hline(yintercept=0,color='gray70')+
    geom_point(aes(x=tsquared,y=y_m))+
    geom_abline(intercept=0,slope=4.726,color='blue')+
    ylim(0,5)+xlim(0,1.2)+
    xlab('$t^2$, \\unit{\\second\\squared}')+
    ylab('$y$, \\unit{\\meter}')+
    theme_bw(base_size=8)
ggsave('fig2.svg',plot=fig,width=3.4167,height=2,units="in")

# do fit
model1 <- lm(y_m~tsquared+0,data)
print(summary(model1))
