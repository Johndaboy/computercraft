-- chest_monitor.lua
function print_inventory_on_monitor(chest, monitor)
    local text_height = #(chest.list())
    local slot = 0
    for number, item in pairs(chest.list()) do
        local name_width = string.len(item.name)
        local quantity_width = string.len(item.count)
        monitor.setCursorPos(width / 2 - name_width / 2, (height / 2 - text_height) + slot)
        monitor.setTextColour(1)
        monitor.write(("%s"):format(item.name))
        slot = slot + 1
        monitor.setCursorPos(width / 2 - quantity_width / 2, (height / 2 - text_height) + slot)
        monitor.setTextColour(256)
        monitor.write(("%dx"):format(item.count))
        slot = slot + 1
    end
end

---  De while loop om elke 10 seconden de monitor te updaten

while true do
    local monitor = peripheral.find("monitor")
    width, height = monitor.getSize()
    local chest = peripheral.find("chest")

    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end