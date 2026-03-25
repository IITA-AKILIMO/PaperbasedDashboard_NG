# Install Required Packages for AKILIMO Paper Based Dashboard
# Run this script before running the application

# Check and install missing packages
install_if_missing <- function(packages) {
  for (pkg in packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message(paste("Installing:", pkg))
      install.packages(pkg, repos = "https://cloud.r-project.org/")
    }
  }
}

# Core packages
core_packages <- c(
  "shiny",
  "shinydashboard",
  "shinyWidgets",
  "DT",
  "dplyr",
  "tidyr",
  "ggplot2",
  "plotly",
  "qpdf",
  "gtools",
  "Cairo"
)

# GIS/Spatial packages
gis_packages <- c(
  "sf",
  "raster",
  "tmap",
  "leaflet",
  "ggspatial",
  "spData",
  "cartogram",
  "rasterVis"
)

# Visualization packages
viz_packages <- c(
  "viridis",
  "RColorBrewer",
  "gridExtra",
  "ggthemes",
  "ggrepel",
  "hexbin"
)

# UI/UX packages
ui_packages <- c(
  "formattable",
  "shinyalert",
  "shinybusy",
  "shinycssloaders",
  "shinyjs"
)

# Additional utilities
util_packages <- c(
  "plyr",
  "grid",
  "gtable",
  "tools"
)

# Install all packages
message("Installing core packages...")
install_if_missing(core_packages)

message("Installing GIS/spatial packages...")
install_if_missing(gis_packages)

message("Installing visualization packages...")
install_if_missing(viz_packages)

message("Installing UI/UX packages...")
install_if_missing(ui_packages)

message("Installing utility packages...")
install_if_missing(util_packages)

message("Package installation complete!")
message("Run the app with: shiny::runApp('.')")