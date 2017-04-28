set my_user_etopia = "chase@etopia.nl"
set imap_user = "$my_user_etopia"

set smtp_url = "smtp://$my_user_etopia@eb-web1.movenext.nl:587/"
set smtp_pass = "$my_pass_etopia"
set from = "$my_user_etopia"
set realname = "Chase Sillevis"

set folder = "imaps://eb-web1.movenext.nl:993"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record = "+Sent"

set header_cache=~/.mutt/cache/headers
set message_cachedir=~/.mutt/cache/bodies
set certificate_file=~/.mutt/certificates

set move = no
set sort = 'threads'
set sort_aux = 'last-date-received'
set imap_check_subscribed

set ssl_force_tls = yes
unset ssl_starttls

ignore "Authentication-Results:"
ignore "DomainKey-Signature:"
ignore "DKIM-Signature:"
hdr_order Date From To Cc

account-hook $folder "set imap_user=$my_user_etopia imap_pass=$my_pass_etopia"
