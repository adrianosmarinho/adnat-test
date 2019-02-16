class User < ApplicationRecord
    #just a reminder that ApplicationRecord inherits from ActiveRecord::Base
    #therefore User (and other models) come with a lot of methods that allows us to interact
    #with the database and other stuff

    

    #makes it downcase before saving
    before_save { self.email = email.downcase }

    # there must be a name! (presence: true is a one element options hash). Our names should stay with 50 chars
    validates :name, presence: true, length: {maximum: 50}
    #remember, this is the same as
    #validates(:name, {presence: true})

    #there must be an email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #simplified regex email from https://www.railstutorial.org/book/modeling_users
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}

    #a user has a password
    #here i used the method has_secure_password following the instructions of
    #https://www.railstutorial.org/book/modeling_users
    has_secure_password # this uses a hash function called bcrypt, see the gemfile

    #with has_secure_password, we get:
    #The ability to save a securely hashed password_digest attribute to the database
    # A pair of virtual attributes (password and password_confirmation),
    # including presence validations upon object creation and a validation requiring that they match
    # An authenticate method that returns the user when the password is correct (and false otherwise)
    # the user database table needs a password_digest attribute
    
    #password needs validation, adnat requires a minimum length of 6
    validates :password, presence: true, length: { minimum: 6 }

end
