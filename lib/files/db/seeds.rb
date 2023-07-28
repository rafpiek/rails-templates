p "Create sample user"

user = User.first_or_create(
  email: "email@email.com",
  password: "password",
  password_confirmation: "password"
)

p "User #{user.email} created."
