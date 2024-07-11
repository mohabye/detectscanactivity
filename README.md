# detectscanactivity

This script is designed to detect network scan activity by monitoring for instances where a single source IP sends more than 500 packets to different ports within a specific time range. The parameters, such as the time range and the packet count threshold, are configurable. When scan activity is detected, an alert is sent to a Telegram bot with detailed information about the scan.

Features
Configurable Parameters: Adjust the time range and packet count threshold to suit your monitoring needs.
Real-Time Alerts: Receive alerts on Telegram with the following details:
Firewall action (Allow or Deny)
Number of packets sent
Time of the activity
Source IP
Destination IP

Prerequisites
Python 3.x
Requests library for HTTP requests
Telegram Bot API token

Installation
Clone the repository:
git clone https://github.com/mohabye/detectscanactivity
cd network-scan-detection

Script Details
The script performs the following steps:

Monitor Network Traffic: Continuously monitors network traffic and tracks the number of packets sent by each source IP to different ports.
Detect Scan Activity: Checks if any source IP sends more than the specified threshold of packets within the defined time range.
Send Alert: If scan activity is detected, the script sends an alert to the specified Telegram bot with details including the firewall action, packet count, time, source IP, and destination IP.


![image](https://github.com/mohabye/detectscanactivity/assets/76062472/7ab3c14c-b455-4e53-876e-b9320eb16daf)

![image](https://github.com/mohabye/detectscanactivity/assets/76062472/efa25182-27c7-48e1-9256-8944fc8ce8e0)


