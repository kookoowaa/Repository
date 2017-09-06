class Time(SimpleTime):
    '''
    Represents time in military format, and demonstrates how to use
    properties (@property decorator) to control class member access.

        Attributes: hour, minute, second (now they have PRIVATE ATTRIBUTES __hour,
                        __minute, __second where the data is actually held by using
                        a decorator @ property; so that their data are now properly validated)
                    seconds (SimpleTime.seconds() method returns a single int, so from the user's point of view,
                        it could be treated as a data attribute; so a decorator @property is used to
                        create "read-only" attribute with only a 'getter'), so this 'seconds' attribute
                        cannot be directly written to or deleted as if PRIVATE.

    Methods: ==, !=, >, >=, <, <=, +, -
    Usage:
      Validation for hour, minute, second is implemented.
      >>> t = SimpleTime(24, -10, -123456)
      >>> t
      SimpleTime<24:-10:-123456>
      >>> t = Time(24, 10, 59)
      Traceback (most recent call last):
      ...
      AssertionError: <hour> must be non-negative integer and less than 24

      All the comparison operators are implemented (i.e., <, <=, >, >=),
      in addition to ==, !=
    '''


# === Initializer ==================
def __init__(self, hour=0, minute=0, second=0):
    """Initializes hour, minute, and second."""
    super().__init__(hour, minute, second)


# === Properties
@property
def seconds(self):
    minutes = self.hour * 60 + self.minute
    seconds = minutes * 60 + self.second
    self.__second = seconds
    return self.__second

