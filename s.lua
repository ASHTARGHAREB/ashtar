--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]

local function keko_tshake(data)
    JSON = (loadfile  "./libs/dkjson.lua")()
    local msg = data.message_
    URL = require('socket.url')
    text = msg.content_.text_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    HTTP = require("socket.http")
    bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_keko[1])
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
          function is_creator(user_id, chat_id)
            local var = false
            local hash =  'bot:creator:'..chat_id
            local creator = database:sismember(hash, user_id)
              local hashs =  'bot:admins:'
            local admin = database:sismember(hashs, user_id)
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
if text then 
if text == 'تعطيل الاختصار' then 
send(msg.chat_id_, msg.id_, 1, "تم تعطيل اختصار الروابط في المجموعه 🖲┇", 1, 'html')
database:set("keko:short"..bot_id..msg.chat_id_,'keko')
end
if text == 'تفعيل الاختصار' then 
send(msg.chat_id_, msg.id_, 1, "تم تفعيل اختصار الروابط في المجموعه 🖲┇", 1, 'html')
database:del("keko:short"..bot_id..msg.chat_id_)
end

local keko = database:get("keko:short"..bot_id..msg.chat_id_)
if not keko then 
local text = msg.content_.text_:gsub('short','اختصار')
if text:match("^(اختصار) (.*)$") then 
local keko2 = {string.match(text, "^(اختصار) (.*)$")}
local req = HTTP.request('http://caut-link.tk/api/?api=a591ca34f771237a385fd9ebadc13e0ec48490f7&url='..URL.escape(keko2[2])..'&alias=')
local data2 = JSON.decode(req)
if not data2.shortenedUrl then  
send(msg.chat_id_, msg.id_, 1, "حدث خطأ 🖲┇", 1, 'html')                 
return false end	
send(msg.chat_id_, msg.id_, 1, "🖲┇ الرابط ~⪼  {"..keko2[2]..'}\n\n 💡┇ الرابط المختصر  ~⪼ {'..data2.shortenedUrl..'}', 1, 'html')                 
end
end
end  -- end text 
end
return {
    keko_tshake = keko_tshake,
}
--[[
 BY : TshAkETEAM
 Channel Files : https://t.me/tshakeFiles
]]
    
