--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
sudos = dofile('sudo.lua')
  local msg = data.message_
  local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
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
  },
  }, dl_cb, nil)
  end
  if msg.content_.text_ then 
  if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then 
  text = msg.content_.text_
  if text:match("^(tm) (.*)$") then
  local kekoj = {string.match(text, "^(tm) (.*)$")}     
   local keko = io.popen(kekoj[2]):read("*all")
   send(msg.chat_id_, msg.id_, 1, keko, 1)
end
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