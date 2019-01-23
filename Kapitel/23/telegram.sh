#!/bin/csh
# [de] Zweck: Verschicke wichtige Syslog-Meldungen an Telegram
# [en] purpose: send important syslog messages to telegram


# [de] Zugriff zur Telegram-API
# [en] Access credentials for the Telegram API
set API_KEY=419840419:AAGPcJDOIe5YCS_ep3yfgPJM-f7E7m8MMMY
set CHAT_ID=273171581

# [de] ein kleines Feedback fuer Syslog
# [en] give syslog feedback about script start
logger -t telegram starting up

while ( 1 )
  # [de] Wie lautet die aktuelle Syslog-Meldung?
  # [en] Store the current syslog message
  set LINE = "$<"

  # [de] Beschreibt die Meldung einen meldenswerten Zustand?
  # [en] compare the message with pre-defined conditions
  if ( "$LINE" =~ "*Web GUI authentication error*" \
    || "$LINE" =~ "*is down, removing from routing*" \
    || "$LINE" =~ "*failed waiting for configd*" \
    || "$LINE" =~ "Telegram-Test" ) then

    /usr/local/bin/curl --insecure --data "chat_id=${CHAT_ID}&text=${LINE}" https://api.telegram.org/bot${API_KEY}/sendMessage
  endif
end
exit 0
