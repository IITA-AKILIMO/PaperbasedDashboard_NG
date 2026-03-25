# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an R Shiny application for AKILIMO - a cassava crop recommendation tool developed by IITA (International Institute of Tropical Agriculture). The dashboard provides agricultural decision support for cassava farmers in Nigeria, Tanzania, Rwanda, and Ghana.

## Use Cases

The app supports two main use cases:
1. **Fertilizer Recommendation** - Provides fertilizer application rates (Urea, NPK) by Local Government Area (LGA) and planting month, with expected yield responses
2. **Scheduled Planting** - Provides expected yield for different planting and harvest schedules

## Running the Application

```r
# From R or RStudio
shiny::runApp(".")

# Or load both ui and server explicitly
shiny::runApp(appDir = ".", port = 5050)
```

The app expects to find:
- GIS shapefile layers in the working directory (gadm36_NGA_1, gadm36_NGA_2, gadm36_TZA_1, etc.)
- RDS data files (FRrecom_lga_level*.RDS) for fertilizer recommendations

## Key Architecture

### Main Files
- `server.R` - Main Shiny server logic
- `ui.R` - Shiny UI definition using bootstrap and shinydashboard
- `functions.R`, `functionspp.R` - Utility functions
- `SP_functions.R` - Scheduled Planting specific functions

### Submodules
- `SP/` - Contains a separate Scheduled Planting dashboard (server.R, ui.R, shiny modal.R)

### GIS Data Processing
The app uses `readOGR()` to load shapefile layers:
- `gadm36_NGA_1`, `gadm36_NGA_2` - Nigeria boundaries (state/LGA level)
- `gadm36_TZA_1`, `gadm36_TZA_2` - Tanzania boundaries
- `gadm36_RWA_1`, `gadm36_RWA_2` - Rwanda boundaries
- `gadm36_GHA_1`, `gadm36_GHA_2` - Ghana boundaries
- `Places_towns` - Town/city locations
- `Rivers` - River features

### Deprecated Package Warning
The codebase currently uses `rgdal` which was retired in October 2023. Migration to `sf` package is needed:
- Replace `library(rgdal)` with `library(sf)`
- Replace `readOGR(dsn = ".", layer = "name")` with `st_read(dsn = ".", layer = "name", quiet = TRUE)`
- The `sp`, `rgeos`, and `maptools` packages can also be removed after migration since `sf` replaces their functionality

## Country-Specific Variations

Different countries use different fertilizer types:
- **Nigeria**: Urea, NPK 15:15:15
- **Tanzania**: Urea, NPK 17:17:17, DAP

## Important Dependencies

Core mapping: `tmap`, `leaflet`, `sf`, `raster`, `rgdal`
Data processing: `dplyr`, `tidyr`, `plyr`
Visualization: `ggplot2`, `plotly`, `rasterVis`
UI: `shiny`, `shinydashboard`, `shinyWidgets`, `DT`