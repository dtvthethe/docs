input_file = open('data.txt', 'r')

point_list = []

for line in input_file.readlines()[1:]:
    line_split =  line.strip().split(',')
    point_list.append((int(line_split[0]), int(line_split[1])))
input_file.close()

print(point_list)