require 'csv'
require 'benchmark'
require 'active_record'
require 'activerecord-import'
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    username: 'postgres',
    password: 'postgres',
    database: 'userdb'
)
=begin
class User < ActiveRecord::Base
    def self.import_users_without_validations(users)
        transaction do
            import([:name, :email, :phone, :address, :day_of_birth, :profile], users, validate: false, on_duplicate_key_ignore: true)
        end
    end
end
=end
def printTimeSpent
    time = Benchmark.realtime do
        yield
    end
    puts "Time Spent: #{time.round(2)}"
end
def createFileCSV(filename)
    headers = ["name", "email", "phone", "address", "day_of_birth", "profile"]
    name = "Nguyen Van A "
    email = "nguyenvanax@gmail.com"
    phone = "0123456789"
    address = "Ho Chi Minh City"
    dayOfBirth = "2000/01/01"
    profile = 'Like TV 100", Some special charactor: \ / \' $ ~ & @ # ( ; "'
    CSV.open(filename, "w") do |csv|
        500000.times do |row|
            csv << [name + row.to_s, email.sub("x",row.to_s), phone, address, dayOfBirth, profile]
        end
    end
end
=begin
#Cach 1 
#Time ~ 29s -> 30s
def runExercise(fileName)
    printTimeSpent do
        #users = CSV.foreach(fileName, headers: false).map(&:to_a)
        users = CSV.new(File.read(fileName), headers: false).map(&:to_a)
        User.import_users_without_validations(users)
    end
end
=end
=begin
create table users(
	id int generated always as identity,
	name text,
	email text,
	phone text,
	address text,
	day_of_birth date,
	profile text
);
=end

#Cach 2
#Time ~ 1.3s -> 1.7s
def runExercise(fileName)
    printTimeSpent do
        conn = ActiveRecord::Base.connection
        rc = conn.raw_connection
        rc.exec("COPY users (name, email, phone, address, day_of_birth, profile) FROM STDIN WITH DELIMITER ',' CSV")

        file = File.open(fileName, 'r')
        while !file.eof?
            rc.put_copy_data(file.readline)
        end

        rc.put_copy_end

        while res = rc.get_result
            if e_message = res.error_message
                p e_message
            end
        end
    end
end
createFileCSV "data.csv"
runExercise "data.csv"