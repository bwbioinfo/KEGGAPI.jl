library(microbenchmark)
library(JuliaCall)
library(KEGGREST)
library(reticulate)
library(ggplot2)
library(RColorBrewer)
library(knitr)
library(tidyverse)

# reticulate::py_install("biopython")
import("Bio.KEGG.REST", as = "BK") -> BK

# julia_install_package("https://github.com/bwbioinfo/KEGGAPI.jl")
julia_library("KEGGAPI")

microbenchmark(
    "Get - Julia" = {
        julia_command(
            cmd = 'KEGGAPI.kegg_get(["hsa:10548"])',
            show_value = FALSE
        )
    },
    "List - Julia" = {
        julia_command(
            cmd = 'KEGGAPI.list("pathway")',
            show_value = FALSE
        )
    },
    "Info - Julia" = {
        julia_command(
            cmd = 'KEGGAPI.info("kegg")',
            show_value = FALSE
        )
    },
    "Get - R" = {x <- keggGet("hsa:10458")},
    "Info - R" = {x <- keggInfo("kegg")},
    "List - R" = {x <- keggInfo("pathway")},
    "Info - Python" = {x <- BK$kegg_info("KEGG")},
    "Get - Python" = {x <- BK$kegg_get("hsa:10548")},
    "List - Python" = {x <- BK$kegg_list("pathway")},
    "Info - Curl" = {x <- system("curl https://rest.kegg.jp/info/KEGG", intern = TRUE)},
    "List - Curl" = {x <- system("curl https://rest.kegg.jp/list/pathway", intern = TRUE)},
    "Get - Curl" = {x <- system("curl https://rest.kegg.jp/get/hsa:10548", intern = TRUE)}
) -> mbm

autoplot(mbm)

tibble(
    "Expr" = mbm$expr,
    "Time" = mbm$time
) %>%
    mutate(Time = Time/1e9) %>%
    separate(Expr, c("Function", "Language"), sep = "\\s-\\s") %>%
    group_by(Function, Language) %>%
    summarise(
        Mean = mean(Time),
        SD = sd(Time)
    ) %>%
    mutate(
        Expr = paste(Function, Language, sep = " - ")
    ) ->
    summary_table

# summary_table %>%
#     select(-Expr) %>%
#     write_csv("benchmark_compare.csv")

ggplot(
    summary_table,
    aes(
        x = Expr,
        y = Mean,
        fill = Language
    )
) +
    geom_bar(
        stat = "identity",
        position = position_dodge(width = 0.8),
    ) + theme_minimal() +
    geom_errorbar(
        aes(
            ymin = Mean - SD,
            ymax = Mean + SD),
        position = position_dodge(width = 0.8), width = 0.2
    ) +
    xlab("Kegg Function and Interface") +
    ylab("Time (s)") +
    scale_fill_brewer(palette = "Set1") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

# ggsave(
#     "benchmark_compare.png",
#     width = 20,
#     height = 10,
#     units = "cm"
# )

knitr::kable(
    summary_table %>%
        select(-Expr),
    format = "latex",
    caption = "Sample Benchmarks"
)


