# https://octopus.energy/dashboard/developer/
library(httr)
source("~/octopusAPI_key.R") # do not keep in this repo unless you totally trust .gitignore

# curl -u "$API_KEY:" https://api.octopus.energy/v1/accounts/
cmd <- paste0("curl -u '",apiParams$key,":' https://api.octopus.energy/v1/accounts/")
df <- system(cmd)

# elec

apiKey <- paste0(apiParams$key, ":")
elecUrl <- paste0("https://api.octopus.energy/v1/electricity-meter-points/",
                  apiParams$elec_mpan,
                  "/meters/",
                  apiParams$elec_serial,
                  "/consumption/"
                  )

req <- GET(elecUrl, 
           authenticate("user", "pass", type = "basic"),
           add_headers(auth_appkey = apiKey))
stop_for_status(req)
content(req)
