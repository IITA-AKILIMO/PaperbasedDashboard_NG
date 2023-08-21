# library(shiny)
# library(shinyjs)
# library(DT)
# 
# ui <- fluidPage(
#   shinyjs::useShinyjs(),
#   sidebarLayout(
#     sidebarPanel(
#       
#     
#       
#       selectInput("usecase", "Select the use case",
#                   choices = c("Fertilizer Recommendation", "Scheduled Planting"),
#                   selected = ""),
#       
#       # numericInput(inputId = "num1", "Numeric 1", value = 10),
#       # numericInput(inputId = "num2", "Numeric 2", value = 20),
#       #actionButton("run", "GO")
#     ),
#     mainPanel()
#   )
# )
# 
# server <- function(input, output, session) {
#   # observe({
#   #   #The element will be enabled if the condition evaluates to TRUE
#   #   shinyjs::toggleState("run",condition = isTruthy(input$usecase))
#   # })
#   # 
#  # v1_r<- reactiveValues()
#   
#   observeEvent(input$usecase, {
#     
#     useselect <-  reactive(input$usecase)
#     if(useselect == "Fertilizer Recommendation"){
#       paste("SUCCESS!!")
#       }else if(useselect == "Scheduled Planting"){
#       paste("FAILED!!")
#         
#     } 
#   
#     
#   })
#   
# }
# shinyApp(ui, server)
  # observeEvent(input$click, {
  #   
  #   #Save to CSV file
  #   
  #   shinyjs::reset("num1");shinyjs::reset("num2")
  #   removeModal()
  #   
  # })
  
ui <- fluidPage(
  shinyjs::useShinyjs(),
  #actionButton("run", "Run", class = "btn-success"),
  #textOutput("output1")
)
server <- function(input, output, session) {
  
  dataModal <- function(failed = FALSE) {
    modalDialog(
      selectInput("usecase", "Select the use case",
                  choices = c("Fertilizer Recommendation", "Scheduled Planting"),
                  selected = ""),
    )
  }
  
  # Show modal when button is clicked.
 
    

  showModal(dataModal())
  
  
  output$output1 <- renderText({
   if(input$usecase == "Fertilizer Recommendation"){
     paste("success!!")
   }else if(input$usecase == "Scheduled Planting"){
     paste("failed!!")
     
   }
   
  })
}
shinyApp(ui = ui, server = server)


library(shiny)
library(shinysky)

shinyApp(
  ui = fluidPage(
    shinyalert("idTestAlert"),
    actionButton("idTestBtn", "Show Alert"),
    verbatimTextOutput("idText")),
  server = function(session, input, output) {
    btnCounter <- reactive({
      browser()
      if (is.null(input[["idTest"]])) 0
      else input[["idTest"]]
    })
    observe({
      if (input$idTestBtn>0)        
        showshinyalert(session,
                       "idTestAlert", 
                       HTML("<script>Shiny.unbindAll();  </script>Test <button id='idTest' type='button' class='btn action-button btn-warning'>Confirm</button> <script>Shiny.bindAll();</script>"),
                       styleclass="warning")
    })
    
    
    output$idText <- renderText({btnCounter()})
  }
)
shinyApp(ui = ui, server = server)
# library(shiny)
# 
# ui = fluidPage(
#   mainPanel(
#     actionButton("createfile", "Create"),
#     actionButton("deletefile", "Delete")
#   )
# )
# 
# # Define server logic required to draw a histogram
# server = function(session, input, output) {
#   
#   observeEvent(input$createfile, {
#     showModal(modalDialog(
#       tagList(
#         textInput("newfilename", label = "Filename", placeholder = "my_file.txt")
#       ), 
#       title="Create a file",
#       footer = tagList(actionButton("confirmCreate", "Create"),
#                        modalButton("Cancel")
#       )
#     ))
#   })
#   
#   
#   observeEvent(input$deletefile, {
#     showModal(modalDialog(
#       tagList(
#         selectInput("deletefilename", label = "Delete a file", choices = list.files(pattern="*.txt"))
#       ), 
#       title="Delete a file",
#       footer = tagList(actionButton("confirmDelete", "Delete"),
#                        modalButton("Cancel")
#       )
#     ))
#   })
#   
#   observeEvent(input$confirmCreate, {
#     req(input$newfilename)
#     file.create(input$newfilename)
#     removeModal()
#   })
#   
#   observeEvent(input$confirmDelete, {
#     req(input$deletefilename)
#     file.remove(input$deletefilename)
#     removeModal()
#   })
# }
# 
# # Run the application 
# shinyApp(ui = ui, server = server)
# 
