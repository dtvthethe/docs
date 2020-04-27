try:
	print(1)

	raise Exception("my error")_
except BaseException as e:
	print(2)
else:
	print(3)
finally:
	print(4)