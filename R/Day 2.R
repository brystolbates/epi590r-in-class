quarto::quarto_check()
install.packages("quarto")
library(quarto)
quarto::quarto_check()
quarto::quarto_path()
install.packages(c("knitr", "rmarkdown", "jsonlite", "yaml", "xml2"))
install.packages("tinytex")
tinytex::install_tinytex()
quarto::quarto_check()

# -------------------------------
# Quarto R Setup Script
# -------------------------------

# List of required packages
required_packages <- c("knitr", "rmarkdown", "jsonlite", "yaml", "xml2", "tinytex")

# Install missing packages
for (pkg in required_packages) {
	if (!requireNamespace(pkg, quietly = TRUE)) {
		install.packages(pkg, dependencies = TRUE)
	}
}

# Install TinyTeX for PDF support
if (!tinytex::is_tinytex()) {
	tinytex::install_tinytex()
}

# Test loading packages
for (pkg in required_packages) {
	if (!requireNamespace(pkg, quietly = TRUE)) {
		message(paste("Package not installed:", pkg))
	} else {
		message(paste("Package installed:", pkg))
	}
}

message("✅ Quarto R packages installed and checked.")
