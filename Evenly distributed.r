# 极速构建
data_1 <- data.frame(x = c(-1, 0, 1, 2), y = c(0, 0, 1, 1)) # 构建主要的数据点

# 添加新的数据点以定义引导线
# 竖线的引导线，从(0,0)到(1,0)
df_line_s <- data.frame(x = c(1, 1), y = c(0, 1))

# 横线的引导线，从(0,1)到(1,1)
df_line_h <- data.frame(x = c(0, 1), y = c(1, 1))

library(ggplot2)
ggplot(data = data_1, aes(x = x, y = y)) +
    geom_point() + # 显示点
    geom_line() + # 连接所有点，使用group=1确保所有点被连接
    ggtitle("The distribution of uniform(0,1)") + # 添加标题
    # 添加引导线
    geom_line(data = df_line_s, aes(x = x, y = y), linetype = "dashed", color = "blue") +
    geom_line(data = df_line_h, aes(x = x, y = y), linetype = "dashed", color = "blue") + # 绘制虚线引导线
    # 添加坐标轴
    # 添加坐标轴，y轴
    annotate("segment",
        x = 0, y = 0, xend = 0, yend = 1.25, # 确定箭头的起始点
        arrow = arrow(length = unit(0.1, "cm"), type = "closed", ends = "last"),
        size = 0.5, color = "blue"
    ) +
    # 添加坐标轴，x轴
    annotate("segment",
        x = -1.25, y = 0, xend = 2.1, yend = 0, # 确定箭头的起始点
        arrow = arrow(length = unit(0.1, "cm"), type = "closed", ends = "last"),
        size = 0.5, color = "blue"
    ) +
    # 添加坐标轴注释
    annotate("text", x = 0, y = 1.3, label = "F(x)") +
    annotate("text", x = 2.15, y = 0, label = "x")
