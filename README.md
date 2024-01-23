# fi.oh2th.fi.mqtt-date-time

This Perl script updates two MQTT topics, "system/date" and "system/time," every minute with the current date and time. The date is formatted with a Finnish weekday in two characters followed by yyyy-MM-dd, and the time is in 24-hour format as HH:mm. The script utilizes the Net::MQTT::Simple module for MQTT communication and Time::HiRes for precise timing.
