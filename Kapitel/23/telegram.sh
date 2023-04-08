#!/bin/csh
# [de] Zweck: Verschicke wichtige Syslog-Meldungen an Telegram
# [en] Purpose: send important syslog messages to Telegram


# [de] Zugriff auf die Telegram-API
# [en] Credentials for the Telegram API
set API_KEY=419840419:AAGPcJDOIe5YCS_ep3yfgPJM-f7E7m81234
set CHAT_ID=273171234

# [de] Wie lautet die aktuelle Syslog-Meldung?
# [en] Store the current syslog message
set LINE = "$<"

# [de] Meldung an Telegram schicken
# [en] Send message to Telegram
/usr/local/bin/curl --insecure --data "chat_id=${CHAT_ID}&text=${LINE}" \
  https://api.telegram.org/bot${API_KEY}/sendMessage

exit 0
