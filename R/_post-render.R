# Load Packages -----

library(beepr)
library(brandr)
library(here)
library(lockr) # github.com/danielvartan/lockr

# Encrypt `index.html` with StatiCrypt -----

html_file <- here("docs", "index.html")

if (file.exists(html_file)) {
  html_file |>
    staticrypt(
      password = Sys.getenv("ACESSOSAN_PIN"),
      directory = dirname(html_file),
      remember = FALSE,
      template_color_primary = get_brand_color("primary"),
      template_color_secondary = get_brand_color("secondary"),
      template_error = "Incorrect PIN. Please try again.",
      template_placeholder = "PIN",
      template_toggle_hide = "Hide PIN",
      template_toggle_show = "Show PIN"
    )
}

# Check If the Script Ran Successfully -----

beep(1)

Sys.sleep(3)
