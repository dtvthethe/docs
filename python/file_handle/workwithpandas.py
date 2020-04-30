import pandas

str_path_file = "C:\\Users\\Admin\\Downloads\\airline.xls"

data = pandas.read_excel(str_path_file)

print(data.get)