--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
HTTPS = require("ssl.https")
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
if (text and text == 'اضف رد ميديا' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
  send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
  database:set("keko:adda"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local keko = database:get("keko:adda"..msg.sender_user_id_)
if keko == 'yes' then 
  send(msg.chat_id_, msg.id_, 1, "الكلمه : "..text.."\n ارسال الان الميديا", 1, 'md')
  database:set("keko:adda"..msg.sender_user_id_,"yes2")
  database:set("keko:add2"..msg.sender_user_id_, text)
  return false
end
end
if (data.message_.content_.sticker_ or data.message_.content_.voice_ or data.message_.content_.animation_) then 
  local keko = database:get("keko:adda"..msg.sender_user_id_)
  if keko == 'yes2' then 
  send(msg.chat_id_, msg.id_, 1, "تم الحفظ بنجاح", 1, 'md')
  database:del("keko:adda"..msg.sender_user_id_)
  local keko = database:get("keko:add2"..msg.sender_user_id_)
  if data.message_.content_.sticker_ then 
  database:set("keko:st"..keko, data.message_.content_.sticker_.sticker_.persistent_id_)
  end 
  if data.message_.content_.voice_ then 
  database:set("keko:vo"..keko, data.message_.content_.voice_.voice_.persistent_id_)
  end 
  if data.message_.content_.animation_ then 
  database:set("keko:gif"..keko, data.message_.content_.animation_.animation_.persistent_id_)
end
  database:del("keko:add2"..msg.sender_user_id_)
  return false
  end
  end
    if (text and text == 'حذف رد ميديا' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
      send(msg.chat_id_, msg.id_, 1, 'ارسال الان الكلمة', 1, 'md')
      database:set("keko:adda"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local keko = database:get("keko:adda"..msg.sender_user_id_)
    if (keko and keko == 'yes3') then 
      send(msg.chat_id_, msg.id_, 1, "تم حذف : "..text, 1, 'md')
      database:del("keko:adda"..msg.sender_user_id_)
      database:del("keko:gif"..text)
      database:del("keko:vo"..text)
      database:del("keko:st"..text)
      return false
    end
    end
    if text then
      local gif = database:get("keko:gif"..text)
      local vo = database:get("keko:vo"..text)
      local st = database:get("keko:st"..text)  
      local id_keko = msg.id_/2097152/0.5 
      if vo then 
      local url = 'https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&voice='..vo..'&reply_to_message_id='..id_keko
      HTTPS.request(url)
      return false
      end 
      if st then 
      local url = 'https://api.telegram.org/bot'..token..'/sendSticker?chat_id='..msg.chat_id_..'&sticker='..st..'&reply_to_message_id='..id_keko
      HTTPS.request(url)
      return false
      end
      if gif then 
        local url = 'https://api.telegram.org/bot'..token..'/sendDocument?chat_id='..msg.chat_id_..'&document='..gif..'&reply_to_message_id='..id_keko
        HTTPS.request(url)
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
