--[[
BY : AshtaRGhareB
]]
local function AshtaR_GhareB(data)
local msg = data.message_
http = require("socket.http")
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
if msg.content_.text_ then 
text = msg.content_.text_
local text = msg.content_.text_:gsub('zh','زغرفه')
if text:match("^(زغرفه) (.*)$") then
local AshtaRj = {string.match(text, "^(زغرفه) (.*)$")}     
local URL = require('socket.url')
local AshtaR1 = http.request('http://tshake.tk/TshakeApi/zh.php?name=' ..URL.escape(AshtaRj[2]))
local AshtaRd = json:decode(AshtaR1)
send(msg.chat_id_, msg.id_, 1, 'Ⓜ️┇الكلمه : `'..AshtaRj[2]..'`\n\n1⃣┇ `'..AshtaRd.zh1..'`\n\n2⃣┇ `'..AshtaRd.zh2..'`\n\n3⃣┇ `'..AshtaRd.zh3..'`', 1, 'md')          
end
end
end
return {
	AshtaR_GhareB = AshtaR_GhareB,
}

--[[
BY : AshtaRGHareB
]]
