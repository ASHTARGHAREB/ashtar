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
  function is_mod(user_id, chat_id)
    local var = false
    local hash =  'bot:mods:'..chat_id
    local mod = database:sismember(hash, user_id)
      local hashs =  'bot:admins:'
    local admin = database:sismember(hashs, user_id)
      local hashss =  'bot:owners:'..chat_id
    local owner = database:sismember(hashss, user_id)
      local hashss =  'bot:creator:'..chat_id
    local creator = database:sismember(hashss, user_id)
       if mod then
      var = true
       end
       if owner then
      var = true
       end
       if creator then
      var = true
       end
       if admin then
      var = true
       end
    for k,v in pairs(sudo_users) do
    if user_id == v then
    var = true
    end
      end
      local keko_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
      if keko_add_sudo then
var = true
end
return var
end
    local msg = data.message_
    text = msg.content_.text_
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then 
if msg.content_.text_ then 
local text = msg.content_.text_:gsub('تفعيل الاشتراك','activate subscription')
if text:match("^[Aa][Cc][Tt][Ii][Vv][Aa][Tt][Ee] [Ss][Uu][Bb][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then    
if database:get('lang🇬🇵'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_Send ID of the channel now_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,'🔘┇الان ارسل ايدي القناه او معرف القناة', 1, 'html')
end
redis:set('kekoch'..msg.sender_user_id_..''..bot_id, 'id')  
return false end
if text then 
local kekoch = redis:get('kekoch'..msg.sender_user_id_..''..bot_id)
if kekoch == 'text' then 
if text then 
if database:get('lang🇬🇵'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_Has been appointed_'..text, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑️┇تم التعين :  '..text, 1, 'md')
end
if database:get('lang🇬🇵'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_Subscription has been activated_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📡┇تم تفعيل خاصيه الاشتراك', 1, 'html')
end
redis:set('AshtaRch'..msg.sender_user_id_..''..bot_id, 'end')  
redis:set('AshtaRchtext'..bot_id, text)  
return false end
end
if kekoch == 'id' then
local url_keko = 'https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..text..'&user_id='..bot_id
local AshtaR3 = https.request(url_AshtaR)
local AshtaR5 = JSON.decode(AshtaR3)
if (not AshtaR5.result or AshtaR5.result.status == 'left') then   
if database:get('lang🇬🇵'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_Bot is not a channel moderator_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚠️┇البوت ليس ادمن في القناه', 1, 'html')
end
  return false end    
  text = msg.content_.text_
  if (AshtaR5.result or AshtaR5.result.status ~= 'left') then
  if database:get('lang🇬🇵'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_Send the message that appears to non-subscribers_', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكليشه التي سوف تظهر لغير المشترك في القناه', 1, 'html')
  end
  redis:set('AshtaRch'..msg.sender_user_id_..''..bot_id, 'text')  
  redis:set('AshtaRid'..bot_id, text)  
  end
  return false end
  end
  local text = msg.content_.text_:gsub('تعطيل الاشتراك','disable subscription')
  if text:match("^[Dd][Ii][Ss][Aa][Bb][Ll][Ee] [Ss][Uu][Bb][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if database:get('lang🇬🇵'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_Subscription has been disabled_', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '📡┇تم تعطيل خاصيه للاشتراك', 1, 'html')
  end
  redis:del('AshtaRid'..bot_id)  
  redis:del('AshtaRchtext'..bot_id)      
end
end
end
text = msg.content_.text_
if is_mod(msg.sender_user_id_, msg.chat_id_) then 
local AshtaR_ch = database:get("AshtaRid"..bot_id)
local AshtaR_text = database:get("AshtaRchtext"..bot_id)
if (AshtaR_ch and AshtaR_text) then 
local url_AshtaR = 'https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..keko_ch..'&user_id='..msg.sender_user_id_
local AshtaR3 = https.request(url_keko)
local AshtaR5 = JSON.decode(AshtaR3)
if (not AshtaR5.result or AshtaR5.result.status == 'left') then   
send(msg.chat_id_, msg.id_, 1, keko_text, 1, 'md')
return "end" end
end
end
end
return {
	AshtaR_GhareB = AshtaR_GhareB,
}

--[[
BY : AshtaRGhareB
]]
