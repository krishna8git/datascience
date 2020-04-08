# Defining Student class
class Student:
    def __init__(self, sNo, sName, sMarks):
        self.stdId = sNo
        self.stdName = sName
        self.stdMarks = sMarks
    
    def display(self):
        print("Student No: ", self.stdId)
        print("Student Name:", self.stdName)
        print("Student Marks:", self.stdMarks)


# Instantiating Object of Student Class
s1 = Student(1, "Vignesh", 900)
s1.display()
print(s1.__dict__)
