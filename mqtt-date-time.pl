#!/usr/bin/perl

use strict;
use warnings;
use Net::MQTT::Simple;
use Time::HiRes qw(gettimeofday);

# MQTT broker configuration
my $mqtt_broker   = 'mqtt.oh2th.fi'; # Replace with your MQTT broker address

# Function to get the current date and time in the specified format
sub get_formatted_datetime {
    my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime(time);

		# Finnish weekdays
    my @days = qw(Su Ma Ti Ke To Pe La);
    my $weekday = $days[$wday];

    $year += 1900;
    $mon  += 1;

    my $date_str = sprintf("%s %04d-%02d-%02d", $weekday, $year, $mon, $mday);
    my $time_str = sprintf("%02d:%02d", $hour, $min);

    return ($date_str, $time_str);
}

# Main loop to update MQTT topics on the minute change
while (1) {
    my ($date_str, $time_str) = get_formatted_datetime();

    # Calculate the remaining time until the next minute
    my ($sec, $micro) = gettimeofday;
    my $remaining_time = 60 - $sec % 60 - $micro / 1_000_000;

    # Publish to "system/date" topic
    my $mqtt_date = Net::MQTT::Simple->new($mqtt_broker);
    $mqtt_date->publish("system/date", $date_str);
    $mqtt_date->disconnect;

    # Publish to "system/time" topic
    my $mqtt_time = Net::MQTT::Simple->new($mqtt_broker);
    $mqtt_time->publish("system/time", $time_str);
    $mqtt_time->disconnect;

    # Wait for the remaining time until the next minute
    select(undef, undef, undef, $remaining_time);
}
