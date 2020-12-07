require 'bcrypt'
class Person
  #include ActiveModel::Serialization

    #attr_accessor :name

 # def attributes
  # {'name'=>nil}
 # end
 #=======================================
 include ActiveModel::SecurePassword
 has_secure_password
 has_secure_password :recovery_password, validations: false
 attr_accessor :password_digest, :recovery_password_digest
end
