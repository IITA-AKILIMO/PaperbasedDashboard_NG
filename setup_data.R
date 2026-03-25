# setup_data.R
# Downloads all required data files from the GitHub Release into correct data/ subfolders.
# Run this once after cloning the repository:
#   source("setup_data.R")

RELEASE_BASE_URL <- "https://github.com/IITA-AKILIMO/PaperbasedDashboard_NG/releases/download/v1.0.0"

# Map of: destination path -> release asset filename
DATA_FILES <- list(
  # Fertilizer recommendations — Nigeria
  "data/fr/ng/FRrecom_lga_level1_NG_2020.RDS" = "FRrecom_lga_level1_NG_2020.RDS",
  "data/fr/ng/FRrecom_lga_level2_NG_2020.RDS" = "FRrecom_lga_level2_NG_2020.RDS",
  "data/fr/ng/FRrecom_lga_level3_NG_2020.RDS" = "FRrecom_lga_level3_NG_2020.RDS",
  "data/fr/ng/FRrecom_lga_level4_NG_2020.RDS" = "FRrecom_lga_level4_NG_2020.RDS",
  "data/fr/ng/FRrecom_lga_level5_NG_2020.RDS" = "FRrecom_lga_level5_NG_2020.RDS",

  # Fertilizer recommendations — Tanzania
  "data/fr/tz/FRrecom_lga_level1_TZ_2020.RDS" = "FRrecom_lga_level1_TZ_2020.RDS",
  "data/fr/tz/FRrecom_lga_level2_TZ_2020.RDS" = "FRrecom_lga_level2_TZ_2020.RDS",
  "data/fr/tz/FRrecom_lga_level3_TZ_2020.RDS" = "FRrecom_lga_level3_TZ_2020.RDS",
  "data/fr/tz/FRrecom_lga_level4_TZ_2020.RDS" = "FRrecom_lga_level4_TZ_2020.RDS",
  "data/fr/tz/FRrecom_lga_level5_TZ_2020.RDS" = "FRrecom_lga_level5_TZ_2020.RDS",

  # Fertilizer recommendations — Rwanda
  "data/fr/rw/RW_CassavaPaperBased.RDS" = "RW_CassavaPaperBased.RDS",
  "data/fr/rw/FR_RW_FCY.csv"             = "FR_RW_FCY.csv",

  # Scheduled planting — Nigeria
  "data/sp/ng/CY_WLY_coord.RDS"                    = "CY_WLY_coord.RDS",
  "data/sp/ng/WLY_CY_FCY1_Region_2020_Average.RDS"  = "WLY_CY_FCY1_Region_2020_Average.RDS",
  "data/sp/ng/WLY_CY_fcy1_NG_2020_FW_everypoint.RDS" = "WLY_CY_fcy1_NG_2020_FW_everypoint.RDS",
  "data/sp/ng/SP_plDate.csv"                        = "SP_plDate.csv",
  "data/sp/ng/LGApoints.csv"                        = "LGApoints.csv",

  # GIS — Nigeria (NGA_1 boundary)
  "data/gis/ng/gadm36_NGA_1.cpg" = "gadm36_NGA_1.cpg",
  "data/gis/ng/gadm36_NGA_1.dbf" = "gadm36_NGA_1.dbf",
  "data/gis/ng/gadm36_NGA_1.prj" = "gadm36_NGA_1.prj",
  "data/gis/ng/gadm36_NGA_1.shp" = "gadm36_NGA_1.shp",
  "data/gis/ng/gadm36_NGA_1.shx" = "gadm36_NGA_1.shx",

  # GIS — Nigeria (NGA_2 LGA level)
  "data/gis/ng/gadm36_NGA_2.cpg" = "gadm36_NGA_2.cpg",
  "data/gis/ng/gadm36_NGA_2.dbf" = "gadm36_NGA_2.dbf",
  "data/gis/ng/gadm36_NGA_2.prj" = "gadm36_NGA_2.prj",
  "data/gis/ng/gadm36_NGA_2.shp" = "gadm36_NGA_2.shp",
  "data/gis/ng/gadm36_NGA_2.shx" = "gadm36_NGA_2.shx",

  # GIS — Nigeria (towns and rivers)
  "data/gis/ng/Places_towns.CPG"     = "Places_towns.CPG",
  "data/gis/ng/Places_towns.dbf"     = "Places_towns.dbf",
  "data/gis/ng/Places_towns.prj"     = "Places_towns.prj",
  "data/gis/ng/Places_towns.shp"     = "Places_towns.shp",
  "data/gis/ng/Places_towns.shp.xml" = "Places_towns.shp.xml",
  "data/gis/ng/Places_towns.shx"     = "Places_towns.shx",
  "data/gis/ng/Rivers.CPG"           = "Rivers.CPG",
  "data/gis/ng/Rivers.dbf"           = "Rivers.dbf",
  "data/gis/ng/Rivers.prj"           = "Rivers.prj",
  "data/gis/ng/Rivers.shp"           = "Rivers.shp",
  "data/gis/ng/Rivers.shp.xml"       = "Rivers.shp.xml",
  "data/gis/ng/Rivers.shx"           = "Rivers.shx",

  # GIS — World borders
  "data/gis/world/TM_WORLD_BORDERS-0.3.dbf" = "TM_WORLD_BORDERS-0.3.dbf",
  "data/gis/world/TM_WORLD_BORDERS-0.3.prj" = "TM_WORLD_BORDERS-0.3.prj",
  "data/gis/world/TM_WORLD_BORDERS-0.3.shp" = "TM_WORLD_BORDERS-0.3.shp",
  "data/gis/world/TM_WORLD_BORDERS-0.3.shx" = "TM_WORLD_BORDERS-0.3.shx",

  # User guide PDFs
  "data/Scheduled Planting and Harvest Cassava - Nigeria Acre latest.pdf"     = "Scheduled Planting and Harvest Cassava - Nigeria Acre latest.pdf",
  "data/Scheduled Planting and Harvest Cassava - Nigeria Hectare latest.pdf"  = "Scheduled Planting and Harvest Cassava - Nigeria Hectare latest.pdf",
  "data/Scheduled Planting and Harvest Cassava - Tanzania Acre latest.pdf"    = "Scheduled Planting and Harvest Cassava - Tanzania Acre latest.pdf",
  "data/Scheduled Planting and Harvest Cassava - Tanzania Hectare latest.pdf" = "Scheduled Planting and Harvest Cassava - Tanzania Hectare latest.pdf",
  "data/Tailored fertilizer application recommendations for cassava - Nigeria Acre latest.pdf"     = "Tailored fertilizer application recommendations for cassava - Nigeria Acre latest.pdf",
  "data/Tailored fertilizer application recommendations for cassava - Nigeria Hectare latest.pdf"  = "Tailored fertilizer application recommendations for cassava - Nigeria Hectare latest.pdf",
  "data/Tailored fertilizer application recommendations for cassava - Tanzania Acre latest.pdf"    = "Tailored fertilizer application recommendations for cassava - Tanzania Acre latest.pdf",
  "data/Tailored fertilizer application recommendations for cassava - Tanzania Hectare latest.pdf" = "Tailored fertilizer application recommendations for cassava - Tanzania Hectare latest.pdf"
)

download_file <- function(dest, asset) {
  url <- paste0(RELEASE_BASE_URL, "/", utils::URLencode(asset, reserved = TRUE))
  dir.create(dirname(dest), recursive = TRUE, showWarnings = FALSE)
  tryCatch({
    utils::download.file(url, destfile = dest, mode = "wb", quiet = TRUE)
    message("  OK  ", dest)
  }, error = function(e) {
    message("  FAIL ", dest, " — ", conditionMessage(e))
  })
}

message("Downloading data files from GitHub Release ", RELEASE_BASE_URL)
message(sprintf("Total: %d files\n", length(DATA_FILES)))

for (dest in names(DATA_FILES)) {
  if (file.exists(dest)) {
    message("  SKIP ", dest, " (already exists)")
  } else {
    download_file(dest, DATA_FILES[[dest]])
  }
}

message("\nDone. Run the app with: shiny::runApp('.')")
