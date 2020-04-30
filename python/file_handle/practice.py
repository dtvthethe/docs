file_handle = None
arr = []

# try:
#     file_handle = open('data.txt', 'r')
#     lines = file_handle.readlines()

#     for line in lines:
#         arr.append(line.rstrip())
# except BaseException as ex:
#     print(ex.__str__())
# finally:
#     if file_handle is not None:
#         file_handle.close()

with open('data.txt', 'r') as file_handle:
    a = file_handle.readlines()
    print(a)

# True is file closed, False is file opening
print(file_handle.closed)
