### P2. Count the number of picks over the temperature value of 108 between Createtime 2023-09-25 19:00:00 and 2023-09-25 19:10:00 in the sample temp data.

import pandas as pd

data = pd.read_csv('sample-temp-data.csv')
# print(data)

data['Createtime'] = pd.to_datetime(data['Createtime'])

start_time = '2023-09-25 19:00:00'
end_time = '2023-09-25 19:10:00'

picks = data[(data['Createtime'] >= start_time) & (data['Createtime'] <= end_time) & (data['Temp'] > 108)]
# print(picks)

pick_count = len(picks)

print("the number of picks over the temperature value of 108 between Createtime 2023-09-25 19:00:00 and 2023-09-25 19:10:00:", pick_count)
