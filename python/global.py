name = 'A'
print(name)
print(id(name)) # get address in memory global name

def get_name():

	name = 'B'
	print(name)
	print(id(name)) # get address in memory local name

	return name


get_name()