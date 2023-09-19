library(tidyverse)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = paste(
      "Fuel efficiency generally decreases with",
      "engine size"
    )
  )

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = paste(
      "Fuel efficiency generally decreases with",
      "energine size"
    ),
    subtitle = paste(
      "Two seaters (sports cars) are an exception",
      "because of their light weight"
    ),
    caption = "Data from fueleconomy.gov",
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    color = "Car type"
  )

df <- tibble(
  x = runif(10),
  y = runif(10)
)

ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
  )

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_text(aes(label = model), data = best_in_class)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_label(
    aes(label = model),
    data = best_in_class,
    nudge_y = 2,
    alpha = 0.5
  )

ggplot(mpg, aes(displ, hwy)) +
  geom_hline(aes(yintercept = 20, size = 2, color = "white")) +
  geom_point(aes(color = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(
    aes(label = model),
    data = best_in_class,
    alpha = 0.5
  )

class_avg <- mpg %>%
  group_by(class) %>%
  summarise(
    displ = median(displ),
    hwy = median(hwy)
  )

ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_hline(aes(yintercept = 20, size = 2, color = "#FFFFFF")) +
  geom_point(aes(color = class)) +
  geom_point(size = 3, shape = 1, data = class_avg) +
  ggrepel::geom_label_repel(aes(label = class),
                            data = class_avg,
                            size = 4,
                            alpha = 0.7,
                            label.size = 0,
                            segment.color = NA) +
  geom_point() +
  theme(legend.position = "none")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  scale_y_continuous(breaks = seq(15, 40, by = 5))

presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_x_date(
    NULL,
    breaks = presidential$start,
    date_labels = "'%y"
  )
  
  
  
  
  











