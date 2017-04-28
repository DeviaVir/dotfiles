set my_user_fitbit = "chase.sillevis@fitbit.com"
set imap_user = "$my_user_fitbit"
set imap_pass = "$my_pass_fitbit"

set smtp_url = "smtp://$my_user_fitbit@smtp.office365.com:587/"
set smtp_pass = $my_pass_fitbit
set from = "$my_user_fitbit"
set realname = "Chase Sillevis"

set folder = "imaps://outlook.office365.com/"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record = "+Sent Items"

set imap_check_subscribed="yes"
set imap_list_subscribed="yes"
set timeout=15
set mail_check=90
set imap_keepalive=180
set imap_idle
unset mark_old
set ssl_use_sslv3=yes

set move = no
set sort = 'threads'
set sort_aux = 'last-date-received'
set imap_check_subscribed

set ssl_force_tls = yes
set smtp_authenticators = "login"
unset ssl_starttls

hdr_order Date From To Cc

account-hook $folder "set imap_user=$my_user_fitbit"
