class PartTimer:
    '''A Simple Class'''
    hour_rate = 7500
    total_parttimer = 0

    #    nickname = None
    #    def setnickname(self, name):
    #        self.nickname = name


    def __init__(self, name, place='133-dong'):  # initial
        self.total_wage = 0
        self.nickname = name
        self.workplace = place
        PartTimer.total_parttimer += 1
        # self. total_parttimer += 1   인스턴트에 국한


    def getnickname(self):
        return 'My nickname is ' + self.nickname


    def calculate_wage(self, hours):
        daily_wage = Parttimehour_rate * hours
        self.total_wage += daily_wage
        return self.total_wage


class alba(PartTimer):  # 하위 클래스
    pass
