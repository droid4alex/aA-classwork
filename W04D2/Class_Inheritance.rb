require 'byebug'
class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name    
        @title = title
        @salary = salary
        @boss = boss
        @boss.input_employee(self) if @boss != nil
    end

    def bonus(multiplier)
        @bonus = @salary * multiplier
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def input_employee(employee)

        @employees << employee
    end

    def bonus(multiplier)
        subordinates = [self]
        super(multiplier)
        employees_salary = 0
        while !subordinates.empty?
            current_emp = subordinates.shift
            if current_emp.is_a?(Manager)
                current_emp.employees.each do |employee|
                    subordinates << employee
                end
            end
            #debugger
            employees_salary += current_emp.salary
        end
        
            
        employees_salary -= self.salary
        @bonus = multiplier * employees_salary
    end
    

end

Ned = Manager.new("Ned", "Founder", 1000000000, nil)
Darren = Manager.new("Darren", "TA Manager", 78000, Ned)
Shawna = Employee.new("Shawna", "TA", 12000, Darren)
David = Employee.new("David", "TA", 10000, Darren)

# Ned.input_employee(Darren)
# Darren.input_employee(Shawna)
# Darren.input_employee(David)
# p Darren.employees.length
p Ned.bonus(5)
p Darren.bonus(4)
p David.bonus(3)