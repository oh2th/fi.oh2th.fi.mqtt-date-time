# fi.oh2th.fi.mqtt-date-time
Perl script for precise MQTT updates of "system/date" and "system/time" every minute. Formats date with Finnish weekday (2 characters) + yyyy-MM-dd, and time in 24-hour format (HH:mm). Uses Net::MQTT::Simple and Time::HiRes.
