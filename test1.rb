require 'pry'
class User
  @@users = []

  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
    p self
    @@users << self
    p self
  end

  # インスタンスメソッド
  def display_info
    "Name: #{@name}, Email: #{@name}"
  end

  # クラスメソッド
  def self.total_users
    @@users.count
  end
end

user1 = User.new("Alice", "alice@example.com")

puts user1.display_info
puts User.total_users
