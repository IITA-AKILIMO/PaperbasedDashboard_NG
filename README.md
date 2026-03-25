# AKILIMO Paper Based Dashboard

Agricultural decision support tool for cassava farmers in Nigeria, Tanzania, Rwanda, and Ghana. Developed by IITA (International Institute of Tropical Agriculture).

## Use Cases

- **Fertilizer Recommendation** - Provides fertilizer application rates (Urea, NPK) by Local Government Area (LGA) and planting month, with expected yield responses
- **Scheduled Planting** - Provides expected yield for different planting and harvest schedules

## Prerequisites

### R Version
- R 4.0 or higher recommended

### Required R Packages

```r
install.packages(c(
  "shiny",
  "shinydashboard",
  "shinyWidgets",
  "DT",
  "dplyr",
  "tidyr",
  "ggplot2",
  "plotly",
  "sf",
  "raster",
  "tmap",
  "leaflet",
  "ggspatial",
  "viridis",
  "RColorBrewer",
  "gridExtra",
  "formattable",
  "shinyalert",
  "shinybusy",
  "shinycssloaders",
  "ggthemes",
  "ggrepel",
  "spData",
  "cartogram",
  "rasterVis",
  "hexbin"
))
```

## Running the Application

### From R/RStudio

```r
# Navigate to the project directory
setwd("path/to/PaperbasedDashboard_NG")

# Run the app
shiny::runApp(".")

# Or specify port
shiny::runApp(".", port = 5050)
```

### From Command Line

```bash
R -e "shiny::runApp('.')"
```

## Data Files Required

The application requires the following files in the working directory:

### GIS Shapefiles
- `gadm36_NGA_1.shp`, `gadm36_NGA_2.shp` - Nigeria boundaries
- `gadm36_TZA_1.shp`, `gadm36_TZA_2.shp` - Tanzania boundaries
- `gadm36_RWA_1.shp`, `gadm36_RWA_2.shp` - Rwanda boundaries
- `gadm36_GHA_1.shp`, `gadm36_GHA_2.shp` - Ghana boundaries
- `Places_towns.shp` - Town/city locations
- `Rivers.shp` - River features

### RDS Data Files
- `FRrecom_lga_level1_NG_2020.RDS` through `FRrecom_lga_level5_NG_2020.RDS` - Nigeria fertilizer recommendations
- `FRrecom_lga_level1_TZ_2020.RDS` through `FRrecom_lga_level5_TZ_2020.RDS` - Tanzania fertilizer recommendations

## Country-Specific Fertilizer Types

- **Nigeria**: Urea, NPK 15:15:15
- **Tanzania**: Urea, NPK 17:17:17, DAP

## Project Structure

```
PaperbasedDashboard_NG/
├── server.R           # Main Shiny server
├── ui.R               # Shiny UI definition
├── functions.R        # Utility functions
├── functionspp.R      # GIS processing functions
├── SP_functions.R     # Scheduled Planting functions
├── styles.css         # Custom styling
├── README.md          # This file
└── SP/                # Scheduled Planting submodule
```

## Development

### Package Migration Note

This project was migrated from the deprecated `rgdal` package to `sf`. The migration was completed in March 2026.

## License

IITA Internal Project