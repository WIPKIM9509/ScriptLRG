-- Base address
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("13,073.3740234375", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
Result = gg.getResults(gg.getResultCount())
local address1 = string.format("0x%X", Result[1].address)
gg.clearResults()

-- Get Offset Value 1
function getResult1(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("9,024.0;0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() == 3) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[1].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

-- Get Offset Value 2
function getResult2(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-16,912W;0F:3", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() == 21) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[12].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

-- Get Offset Value 3
function getResult3(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("186,048.0;69,772.5;12,900.0;0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() >= 1) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[1].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

-- Get Offset Value 4
function getResult4(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() == 50) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[15].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

-- Get Offset Value 5
function getResult5(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("90", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local Result = gg.getResults(gg.getResultCount())
    local address2 = Result[1].address
    local offset = math.abs(address2 - address1)
    Offset_Result = string.format("0x%X", offset)
    gg.clearResults()
    return Offset_Result
end

-- Get Offset Value 6
function getResult6(address1)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1000000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() == 4) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[3].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

-- Get Offset Value 7
function getResult7(address1)
    gg.setRanges(gg.REGION_C_DATA)
    gg.searchNumber("67,586D;0F:5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber("0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if (gg.getResultCount() >= 73) then
        local Result = gg.getResults(gg.getResultCount())
        local address2 = Result[9].address
        local offset = math.abs(address2 - address1)
        Offset_Result = string.format("0x%X", offset)
        gg.clearResults()
        return Offset_Result
    end
    return "0x0"
end

local URL = 'https://lrg-bot.onrender.com/offset'
local offset1 = getResult1(address1)
local offset2 = getResult2(address1)
local offset3 = getResult3(address1)
local offset4 = getResult4(address1)
local offset5 = getResult5(address1)
local offset6 = getResult7(address1)
local offset7 = getResult6(address1)

local BODY = string.format([[
{
    "offset1": "%s",
    "offset2": "%s",
    "offset3": "%s",
    "offset4": "%s",
    "offset5": "%s",
    "offset6": "%s",
    "offset7": "%s"
}
]], offset1, offset2, offset3, offset4, offset5, offset6, offset7)

local headers = {
    ["Content-Type"] = "application/json",
    ["Content-Length"] = tostring(#BODY)
}

local res = gg.makeRequest(URL, headers, BODY)
if res and res.content then
    gg.alert("Request successful\nกรุณารอข้อความอัพเดตในกลุ่ม Discord เร็วๆนี้")
else
    gg.alert("Request failed\nโปรดตรวจสอบการเชื่อมต่ออินเทอร์เน็ตของคุณ\nหรือแจ้งให้ผู้พัฒนาแก้ไข")
end
