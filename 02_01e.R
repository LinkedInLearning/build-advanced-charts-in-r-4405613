## Load circlize
library(circlize)

## sector names
sectors <- c("Norway", "New Zealand", "Luxembourg", "Vietnam",
             "United Kingdom", "Slovenia", "Greece", "Kazakhstan")

## initialise layout
circos.initialize(sectors, xlim = c(2000,2021))

## plotting region
circos.track(sectors, ylim = c(15, 100),
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter,
                           CELL_META$cell.ylim[2] + mm_y(6),
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })
## clear the environment
circos.clear()
