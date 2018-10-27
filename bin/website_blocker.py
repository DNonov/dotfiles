import time
from datetime import datetime as dt

host_path = "/etc/hosts"
redirect = "127.0.0.1"
black_list = ["www.facebook.com", "www.youtube.com", "www.twiter.com"]


def hour_bound(hour):
    return dt(dt.now().year, dt.now().month, dt.now().day, hour)


current_time = dt.now()
finish_hour = hour_bound(20)
start_hour = hour_bound(8)

while True:
    if start_hour < current_time < finish_hour:
        with open(host_path, "r+") as file:
            content = file.read()
            for website in black_list:
                if website in content:
                    pass
                else:
                    file.write(redirect + " " + website + "\n")
    else:
        with open(host_path, "r+") as file:
            content = file.readlines()
            file.seek(0)
            for line in content:
                if not any(website in line for website in black_list):
                    file.write(line)
            file.truncate()
    time.sleep(5)
