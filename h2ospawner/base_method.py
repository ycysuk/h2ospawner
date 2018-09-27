# base method

class Base():
    def meth(self):
        self.a = 10


class Derived(Base):
    def meth(self):
        super(Derived,self).meth()
        self.a += 10
        print(self.a)


def run():
    d = Derived()
    d.meth()



if __name__ == '__main__':

    run()
