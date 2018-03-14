--[[
BY : AshtaRGhareB
]]
local function AshtaR_GhareB(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_AshtaR[1])
JSON = (loadfile  "./libs/dkjson.lua")()
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = {ID = "TextParseModeMarkdown"}
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
  }, dl_cb, nil)
  end
local msg = data.message_
text = msg.content_.text_
if (text and msg.reply_to_message_id_ ~= 0) then 
  local AshtaR = database:get("AshtaR:re"..text)
  if AshtaR then 
  send(msg.chat_id_, msg.reply_to_message_id_, 1, keko, 1, 'md')
end
end
if (text and text == 'اضف رد بالرد' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
  send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
  database:set("AshtaR:add"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local keko = database:get("AshtaR:add"..msg.sender_user_id_)
if keko == 'yes' then 
  send(msg.chat_id_, msg.id_, 1, "الكلمه : "..text.."\n ارسال الان الرد", 1, 'md')
  database:set("AshtaR:add"..msg.sender_user_id_,"yes2")
  database:set("AshtaR:add2"..msg.sender_user_id_, text)
  return false
end
end
if text then 
  local AshtaR = database:get("AshtaR:add"..msg.sender_user_id_)
  if AshtaR == 'yes2' then 
    send(msg.chat_id_, msg.id_, 1, "الرد : "..text.."\n تم الحفظ بنجاح", 1, 'md')
    database:del("AshtaR:add"..msg.sender_user_id_)
    local AshtaR = database:get("AshtaR:add2"..msg.sender_user_id_)
    database:set("AshtaR:re"..keko,text)
    database:del("AshtaR:add2"..msg.sender_user_id_)
    return false
  end
  end
    if (text and text == 'حذف رد بالرد' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
      send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
      database:set("AshtaR:add"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local AshtaR = database:get("AshtaR:add"..msg.sender_user_id_)
    if (AshtaR and AshtaR == 'yes3') then 
      send(msg.chat_id_, msg.id_, 1, "تم حذف : "..text, 1, 'md')
      database:del("AshtaR:add"..msg.sender_user_id_)
      database:del("AshtaR:re"..text)
      return false
    end
    end
end
return {
	AshtaR_GhareB = AshtaR_GhareB,
}
--[[
BY : AshtaRGhareB
]]
