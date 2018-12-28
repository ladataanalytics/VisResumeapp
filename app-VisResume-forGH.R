#build shiny app
library(shiny)
library(plotly)
library(VisualResume)
library(rsconnect)
#set working directory
setwd("WD")

#RESUME
#pdf("Resume.pdf",width=11,height=8.5)

#Visual-Resume-R-Function/Visual_Resume_RFunction.R
#use June 2019 as the place holder for "present" or "current"
VisualResume::VisualResume(
  titles.left = c("Alfonso Berumen, MS, MBA",
                  "Consultant - Data Scientist - Analytics Professional",
                  "Instructor"),
  titles.right = c("LinkedIn: https://www.linkedin.com/in/alfonsoberumen/",
                   "Personal e-mail: alfonso.berumen@gmail.com",
                   "Education e-mail: alfonsberumen@g.ucla.edu"),
  titles.left.cex = c(3,2,2),
  titles.right.cex = c(2, 1, 1, 1),
  events.cex = (1.5),
  timeline.labels = c("Experience", "Skills and Milestones"),
  timeline.cex = c(1,1),
  timeline = data.frame(title = c("Occidental", 
                                  "UC Irvine", 
                                  "Northwestern",
                                  "Pepperdine",
                                  "Resolution Economics LLC",
                                  "UCLA-Extension",
                                  "Los Angeles Data Analytics"),
                        sub = c("Student", 
                                "Student", 
                                "Student", 
                                "Student", 
                                "Senior Managing Consultant",
                                "Instructor",
                                "Independent Consultant"),
                        start = c(2004+(8/12),
                                  2013+(3/12),
                                  2015+(9/12),
                                  2018+(9/12),
                                  2008+(4/12),
                                  2018+(4/12),
                                  2018+(11/12)
                                  ),
                        end = c(2008+(5/12), 
                                2014+(12/12),
                                2017+(12/12),
                                2019+(6/12),
                                2018+(9/12),
                                2019+(6/12),
                                2019+(6/12)),
                        side = c(0, 0, 0, 0, 1, 1, 1)),
  milestones = data.frame(title = c("BA", "MBA", "MS", 
                                    "Doctorate (Cand.)"),
                          sub = c("Economics", 
                                  "Business Admin.", 
                                  "Predictive Analytics",
                                  "Business Admin."),
                          year = c(2008+(5/12), 
                                   2014+(12/12), 
                                   2017+(12/12), 
                                   2021+(6/12))),
  events = data.frame(year = c(2008+(6/12), 
                               2010+(7/12), 
                               2012+(4/12), 
                               2016+(7/12), 
                               2018+(4/12), 
                               2018+(11/12)),
                      title = c("Consultant",
                                "Senior Consultant",
                                "Manager",
                                "Senior Manager",
                                "Data Analytics & Management Instructor",
                                "Data Scientist")),
  interests = list("programming" = c(rep("SAS", 4), 
                                     rep("R", 4), 
                                     rep("Python", 3), "SQL"),
                   "modelling" = 
                     c(rep("Regression", 3), 
                       rep("Clustering", 3),
                       rep("Decision Trees & Forests", 3)),
                   "teaching-analytics" = 
                     c(rep("Predictive", 5),
                       rep("Machine Learning", 5),
                       rep("Data", 3))),
  year.steps = 1
)

######################
#shiny app
######################
library(shiny)
ui<-shinyUI(fluidPage(titlePanel("Alfonso Berumen - LOS ANGELES DATA ANALYTICS"),
  sidebarLayout(
    sidebarPanel(
      h5("Built with the VisualResume package in R")
    ), 
    mainPanel(
      tabsetPanel(
        # using iframe along with tags() within tab to display pdf with scroll, height and width could be adjusted
        tabPanel("Resume: Published December 2018", 
                 tags$iframe(style="height:400px; width:100%; scrolling=yes", 
                             src="Resume.pdf"))
      )
    ))
))

server <- function(input, output) {
}

rsconnect::setAccountInfo(name='ladataanalytics',
                          token='XXXX',
                          secret='XXXX')
                          
shinyAppDir("WD/app")
rsconnect::deployApp("WD/app", appName = "VisResumeapp",
                     appTitle = "My Vis Resume")