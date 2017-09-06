class SimpleTime:
    '''Represents a simple time
    Attributes: hour, minute, second
    Methods: seconds(), ==, !=
    Usage:
    >>>t1 = SimpleTime(1, 25, 57)
    >>>t1
    SimpleTime<1:25:57>
    >>>print(t1)
    1:25:57
    >>>t1.hour, t1.minute, t1.second
    (1, 25, 57)
    >>>t1.seconds()
    5157
    >>>t2 = SimpleTime(second=30)
    >>>t3 = SimpleTime(0, 0, 30)
    >>>t2 == t3
    True
    >>>t1 == t2
    False
    '''

# === Initializer ================
    def __init__(self, hour=0, minute=0, second=0):
        self.hour = hour
        self.minute = minute
        self.second = second


# === Operation methods ==========
    def seconds(self):
        minutes = self.hour*60 + self.minute
        seconds = minutes*60 + self.second
        return seconds


# === Special methods ============
    def __eq__(self, other):
        return self.seconds() == other.seconds

    def __repr__(self):
        return "{0.__class__.__name__}<{0.hour!r}:<{0.minute!r}:{0.second!r}>".format(self)

    def __str__(self):
        return "<{0.hour!r}:<{0.minute!r}:{0.second!r}>".format(self)