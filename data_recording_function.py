import csv
import os

file_exist = os.path.isfile("SH_COVID_data.csv")
print(file_exist)
if file_exist == False:
    with open('SH_COVID_data.csv','w') as file:
        writer = csv.writer(file)
        writer.writerow(['record_id', 'date', 'case_CT', 'case_NOCT', 'total'])
elif file_exist == True:
    pass
else:
    print('Cannot identify whether the file "SH_COVID_data.csv" exists.')


