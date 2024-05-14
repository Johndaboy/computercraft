local url = "https://raw.githubusercontent.com/Johndaboy/computercraft/blob/main/chest_monitor.lua"
-- Bestandsnaam om naar toe te schrijven
local filename = "chest_monitor.lua"

-- Functie om het bestand te downloaden
local function downloadFile(url, filename)
    -- Maak het HTTP-verzoek
    local response = http.get(url)
    
    if response then
        -- Open het bestand om te schrijven
        local file = fs.open(filename, "w")
        -- Schrijf de inhoud van de respons naar het bestand
        file.write(response.readAll())
        -- Sluit het bestand
        file.close()
        -- Sluit de HTTP-respons
        response.close()
        print("Download voltooid: " .. filename)
    else
        print("Download mislukt")
    end
end

-- Download het bestand
downloadFile(url, filename)