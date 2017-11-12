class Event2:
    def __init__(self, data):
        self.host = data[0]
        self.name = data[1]
        self.location_name = data[2]
        self.location_x = data[3][0]
        self.location_y = data[3][1]
        self.start = data[4][0]
        self.end = data[4][1]
        self.website = data[5]
        self.tags = data[6]


def read_events(filename):
    file = open(filename)
    '''
    File format is every line is an event.
    host name, event name, location name, (location x, location y), list of tags, (start time, end time)
    '''
    events = list()
    
    for line in file:
        pre_data = line.split("|")
        coordinates = pre_data[3].split(",")
        times = pre_data[4].split(",")
        tags = pre_data[6].split(",")
        data = [pre_data[0], pre_data[1], pre_data[2], coordinates, times, pre_data[5], tags]
        events.append(Event2(data))
    return events

'''
filename = input("input filename: ")
events = read_events(filename)
ev1 = events[0]
ev2 = events[1]
ev3 = events[2]
print(ev1.host)
print(ev1.name)
print(ev1.location_name)
print(ev1.location_x)
print(ev1.location_y)
print(ev1.start)
print(ev1.end)
print(ev1.website)
print(ev1.tags)

print(ev2.host)
print(ev2.name)
print(ev3.host)
print(ev3.name)

'''
