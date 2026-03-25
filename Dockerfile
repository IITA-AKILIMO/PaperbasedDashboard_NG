# escape=`
# Windows Server Core container for AKILIMO PaperbasedDashboard_NG
# Requires Docker Desktop with Windows containers mode enabled.
# Build: docker build -t akilimo-dashboard .
# Run:   docker run -p 3838:3838 akilimo-dashboard

FROM mcr.microsoft.com/windows/servercore:ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# ── Chocolatey ────────────────────────────────────────────────────────────────
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = `
        [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString( `
        'https://community.chocolatey.org/install.ps1'))

# ── R 4.4 ─────────────────────────────────────────────────────────────────────
# Binary CRAN packages are used throughout so Rtools is not required,
# but install it anyway so source-only packages can be compiled if needed.
RUN choco install -y r.base --version=4.4.2
RUN choco install -y rtools  --version=4.4.0

# Make Rscript available without a full path in subsequent RUN commands
RUN $rHome = (Get-ChildItem 'C:\Program Files\R' | `
        Sort-Object Name -Descending | Select-Object -First 1).FullName; `
    $binPath = "$rHome\bin\x64"; `
    [Environment]::SetEnvironmentVariable('PATH', `
        "$binPath;" + [Environment]::GetEnvironmentVariable('PATH','Machine'), `
        'Machine'); `
    Write-Host "R bin path added: $binPath"

# ── App ───────────────────────────────────────────────────────────────────────
WORKDIR C:/app

# Copy application source (data files are gitignored and downloaded below)
COPY . .

# ── R packages ────────────────────────────────────────────────────────────────
# All packages have pre-built Windows binaries on CRAN; sf bundles GDAL/PROJ.
# Cairo on Windows uses the built-in GDI backend — no extra system libs needed.
RUN Rscript install_packages.R

# ── Data files ────────────────────────────────────────────────────────────────
# Downloads RDS, CSV, shapefiles and PDFs from GitHub Release v1.0.0
# into the correct data/ subfolders.  Baked into the image so the
# container runs without internet access at runtime.
RUN Rscript setup_data.R

# ── Runtime ───────────────────────────────────────────────────────────────────
EXPOSE 3838

HEALTHCHECK --interval=30s --timeout=15s --start-period=60s --retries=3 `
    CMD powershell -Command `
        "try { (Invoke-WebRequest -Uri http://localhost:3838 -UseBasicParsing).StatusCode } `
         catch { exit 1 }"

CMD ["Rscript", "-e", "shiny::runApp('.', host='0.0.0.0', port=3838, launch.browser=FALSE)"]
