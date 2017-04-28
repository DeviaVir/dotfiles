set my_user_pebble = "chase@sillevis.net"
set imap_user = "$my_user_pebble"

set smtp_url = "smtp://$my_user_pebble@smtp.gmail.com:587/"
set smtp_pass = "$my_pass_pebble"
set from = "$my_user_pebble"
set realname = "Chase Sillevis"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
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

account-hook $folder "set imap_user=$my_user_pebble imap_pass=$my_pass_pebble"
