--[[
BY : AshtaRGhareB
]]

local function AshtaR_GhareB(data)
    JSON = (loadfile  "./libs/dkjson.lua")()
    local msg = data.message_
    URL = require('socket.url')
    text = msg.content_.text_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    HTTPS = require("ssl.https")
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
              local AshtaR_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
              if AshtaR_add_sudo then
              var = true
              end
            return var
end
if text then 
if text == 'تعطيل التطبيقات' then 
send(msg.chat_id_, msg.id_, 1, "☑┇تم تعطيل البحث عن التطبيقات في المجموعه", 1, 'html')
database:set("AshtaR:story"..bot_id..msg.chat_id_,'AshtaR')
end
if text == 'تفعيل التطبيقات' then 
send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعيل البحث عن التطبيقات في المجموعه", 1, 'html')
database:del("AshtaR:story"..bot_id..msg.chat_id_)
end
local AshtaR = database:get("AshtaR:story"..bot_id..msg.chat_id_)
if not AshtaR then 
  local text = msg.content_.text_:gsub('app','تطبيق')
  if text:match("^(تطبيق) (.*)$") then 
  local AshtaR2 = {string.match(text, "^(تطبيق) (.*)$")}
  keyboard = {} 
	keyboard.inline_keyboard = {
	  {
		{text = "🔽┇Android Store", url="https://t.me/ikekoi"},
	  },
    {
		{text = "mobomarket", url='http://www.mobomarket.net/search?keyword='..keko2[2]..''},
    {text = "Mobogenie", url='http://www.mobogenie.com/search.html?q='..keko2[2]..''},
		{text = "apkmirror", url='http://www.apkmirror.com/?s='..keko2[2]..''},
	  },     
    {
		{text = "🔽┇Iphone Store", url="https://t.me/ikekoi"},
	  },
    {
		{text = "appsodo", url='http://www.appsodo.com/search_'..keko2[2]..'_1'},
	  },  
    }
    local id_AshtaR = msg.id_/2097152/0.5 
HTTPS.request('https://api.telegram.org/bot'..token..'/sendMessage?chat_id='..msg.chat_id_..'&reply_to_message_id='..id_keko..'&text='..URL.escape('💡┇تم البحث\n🔽┇اليك النتائج')..'&reply_markup='..JSON.encode(keyboard))
end
end

end  -- end text 
end
return {
    AshtaR_GhareB = AshtaR_GhareB,
}
--[[
 BY : AshtaRGhareB
]]
    
