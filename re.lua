--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
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
  local keko = database:get("keko:re"..text)
  if keko then 
  send(msg.chat_id_, msg.reply_to_message_id_, 1, keko, 1, 'md')
end
end
if (text and text == 'اضف رد بالرد' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
  send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
  database:set("keko:add"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local keko = database:get("keko:add"..msg.sender_user_id_)
if keko == 'yes' then 
  send(msg.chat_id_, msg.id_, 1, "الكلمه : "..text.."\n ارسال الان الرد", 1, 'md')
  database:set("keko:add"..msg.sender_user_id_,"yes2")
  database:set("keko:add2"..msg.sender_user_id_, text)
  return false
end
end
if text then 
  local keko = database:get("keko:add"..msg.sender_user_id_)
  if keko == 'yes2' then 
    send(msg.chat_id_, msg.id_, 1, "الرد : "..text.."\n تم الحفظ بنجاح", 1, 'md')
    database:del("keko:add"..msg.sender_user_id_)
    local keko = database:get("keko:add2"..msg.sender_user_id_)
    database:set("keko:re"..keko,text)
    database:del("keko:add2"..msg.sender_user_id_)
    return false
  end
  end
    if (text and text == 'حذف رد بالرد' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
      send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
      database:set("keko:add"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local keko = database:get("keko:add"..msg.sender_user_id_)
    if (keko and keko == 'yes3') then 
      send(msg.chat_id_, msg.id_, 1, "تم حذف : "..text, 1, 'md')
      database:del("keko:add"..msg.sender_user_id_)
      database:del("keko:re"..text)
      return false
    end
    end
end
return {
	keko_tshake = keko_tshake,
}
--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
