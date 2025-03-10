tabPanel(
  title = tagList(
    "ワクチンの接種",
    boxLabel("New", status = "warning")
  ),
  icon = icon("syringe"),
  value = "vaccine",
  fluidRow(
    column(
      width = 8,
      tags$br(),
      echarts4rOutput("vaccine_line_plot") %>% withSpinner()
    ),
    column(
      width = 4,
      tags$br(),
      tags$p("今までに接種が行われた新型コロナワクチンの接種回数などの情報をお届けします。"),
      fluidRow(
        column(width = 6, uiOutput("vaccine_medical_total")),
        column(width = 6, uiOutput("vaccine_elderly_total"))
      ),
      uiOutput("vaccine_progress"),
      tags$b("注意事項"),
      tags$li("土日祝日の数については、次の平日に合わせて計上しています。"),
      tags$li("各施設が17時時点の実績をワクチン接種円滑化システム（V-SYS）を通して報告したものを集計しています。"),
      tags$li("職域接種の回数は（V-SYS）への報告（前週月曜日から日曜日まで）を集計しているため、水曜日に計上しています。"),
      tags$hr(),
      fluidRow(
        column(
          width = 6,
          actionButton(
            inputId = "vaccineDatadownload",
            label = "データをダウンロード",
            icon = icon("download"),
            onclick = sprintf(
              "window.open('%s')",
              "https://github.com/swsoyee/2019-ncov-japan/blob/master/50_Data/MHLW/vaccine.csv"
            )
          )
        ),
        column(
          width = 6,
          uiOutput("vaccineTwitterShare")
        )
      )
    )
  )
)
