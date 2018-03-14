--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
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
local kekoj = {string.match(text, "^(زغرفه) (.*)$")}     
local URL = require('socket.url')
local kekol = http.request('http://tshake.tk/TshakeApi/zh.php?name=' ..URL.escape(kekoj[2]))
local kekod = json:decode(kekol)
send(msg.chat_id_, msg.id_, 1, 'Ⓜ️┇الكلمه : `'..kekoj[2]..'`\n\n1⃣┇ `'..kekod.zh1..'`\n\n2⃣┇ `'..kekod.zh2..'`\n\n3⃣┇ `'..kekod.zh3..'`', 1, 'md')          
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
