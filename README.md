# AKILIMO Paper Based Dashboard NG

Agricultural decision support tool for cassava farmers in Nigeria, Tanzania, Rwanda, and Ghana. Developed by IITA (International Institute of Tropical Agriculture).

## Use Cases

- **Fertilizer Recommendation** - Provides fertilizer application rates (Urea, NPK) by Local Government Area (LGA) and planting month, with expected yield responses
- **Scheduled Planting** - Provides expected yield for different planting and harvest schedules

## Quick Start

```r
# 1. Clone the repository
# git clone git@github.com:IITA-AKILIMO/PaperbasedDashboard_NG.git

# 2. Install R packages
source("install_packages.R")

# 3. Download data files
source("setup_data.R")

# 4. Run the app
shiny::runApp(".")
```

## Prerequisites

- R 4.0 or higher

### Install Packages

**Option 1: Run the installation script (recommended)**
```r
source("install_packages.R")
```

**Option 2: Manual installation**
```r
install.packages(c(
  "shiny", "shinydashboard", "shinyWidgets", "DT",
  "dplyr", "tidyr", "ggplot2", "plotly",
  "sf", "raster", "tmap", "leaflet", "ggspatial", "spData", "cartogram", "rasterVis",
  "viridis", "RColorBrewer", "gridExtra", "ggthemes", "ggrepel", "hexbin",
  "formattable", "shinyalert", "shinybusy", "shinycssloaders", "shinyjs",
  "plyr", "grid", "tools", "qpdf"
))
```

## Data Setup

Data files (RDS, shapefiles, CSVs) are not tracked in git. Download them from the [GitHub Release](https://github.com/IITA-AKILIMO/PaperbasedDashboard_NG/releases/tag/v1.0.0) by running:

```r
source("setup_data.R")
```

This downloads all required files into the correct `data/` subfolders. It is safe to re-run — existing files are skipped.

### What gets downloaded

| Folder | Contents |
|---|---|
| `data/fr/ng/` | Nigeria fertilizer recommendation RDS files (levels 1–5) |
| `data/fr/tz/` | Tanzania fertilizer recommendation RDS files (levels 1–5) |
| `data/fr/rw/` | Rwanda fertilizer recommendation RDS and CSV |
| `data/sp/ng/` | Nigeria scheduled planting RDS and CSV files |
| `data/gis/ng/` | Nigeria boundary, towns, and rivers shapefiles |
| `data/gis/world/` | World borders shapefile |
| `data/` | User guide PDFs (Nigeria and Tanzania, acre and hectare) |

> GIS data for Tanzania, Rwanda, and Ghana (`data/gis/tz/`, `data/gis/rw/`, `data/gis/gh/`) and Ghana fertilizer data (`data/fr/gh/`) must be added manually — contact the project team for these files.

## Running the Application

### From R/RStudio

```r
setwd("path/to/PaperbasedDashboard_NG")
shiny::runApp(".")

# Or specify port
shiny::runApp(".", port = 5050)
```

### From Command Line

```bash
R -e "shiny::runApp('.')"
```

## Country-Specific Fertilizer Types

- **Nigeria**: Urea, NPK 15:15:15
- **Tanzania**: Urea, NPK 17:17:17, DAP

## Project Structure

```
PaperbasedDashboard_NG/
├── server.R                  # Main Shiny server
├── ui.R                      # Shiny UI definition
├── functions.R               # Utility functions
├── functionspp.R             # GIS processing functions
├── SP_functions.R            # Scheduled Planting functions
├── FR_paperBased_Annex.R     # Fertilizer recommendation annex
├── SP_PaperBased_Annex.R     # Scheduled planting annex
├── install_packages.R        # Package installation script
├── setup_data.R              # Data file download script
├── styles.css                # Custom styling
├── SP/                       # Scheduled Planting submodule
└── data/                     # Data files (gitignored — run setup_data.R)
    ├── fr/                   # Fertilizer recommendation data
    ├── sp/                   # Scheduled planting data
    └── gis/                  # GIS shapefiles
```

## Development

### Package Migration Note

This project was migrated from the deprecated `rgdal`, `sp`, `rgeos`, `dismo`, and `maptools` packages to `sf`. Migration was completed in March 2026.

## License

IITA Internal Project
