# 基础参数配置
x2 <- 1:1000 / 500 # x值的向量
alpha <- c(1 / 3, 2 / 3, 1, 1, 2, 2, 4, 10, 20) # 形状参数
betas <- c(1, 2 / 3, 3, 1, 1, 6, 4, 30, 20) # 原始被当作尺度参数，这里实际上应视为速率的倒数

# 初始化一个空的数据框来保存所有分布的数据
d_0 <- data.frame()

# 循环创建每个分布的数据并追加到d_0中
for (i in 1:9) {
    # 计算当前alpha和beta对应的伽马分布密度
    # 注意：这里使用scale = 1 / betas[i]来计算尺度参数，因为betas实际上是速率的倒数
    y_values <- dgamma(x = x2, shape = alpha[i], scale = 1 / betas[i])

    # 创建当前分布的数据框
    d2 <- data.frame(
        x = x2, # x值
        y = y_values, # 对应的y值（伽马分布密度）
        # 使用sprintf格式化字符串，生成参数标签
        # 注意：这里仍然使用betas[i]作为标签中的b
        pm = sprintf("a=%.1f,b=%.1f", alpha[i], betas[i])
    )

    # 将当前分布的数据框追加到d_0中
    d_0 <- rbind(d_0, d2)
}
library(ggplot2)
# 使用ggplot2绘制所有曲线
ggplot(data = d_0, aes(x = x, y = y, color = pm)) +
    geom_line(linetype = "dashed") + # 添加线条图层，用颜色和线条类型区分不同的参数组合
    ylim(0, 5) +
    ggtitle("Gamma Distribution Curves with Varying Parameters") +
    theme_minimal() +
    使用简洁的主题
labs(color = "Parameters") #   修改图例的名字
