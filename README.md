user-management
===============

A Rails gem for setting up a basic user management system.

This is a proof-of-concept gem for the Open Academy program.

The appthing Rails app utilizes the gem defined in the umanage folder.

Credentials in the appthing site:

ALL USERS have password "asdfasdf". Accessing pages beyond the permission of the current user causes a redirect to Facebook (look into the model files for details).

Users
----
jyao.wow@gmail.com
homer@doh.com

SuperUsers
-----
clark.kent@gmail.com
newuser@gmail.com

Admins
-----
boss@gmail.com

You can login/logout at the URLs http://0.0.0.0:3000/umanage/signin and http://0.0.0.0:3000/umanage/signout.
The resources you can access are http://0.0.0.0:3000/users, http://0.0.0.0:3000/super_users, http://0.0.0.0:3000/admins, http://0.0.0.0:3000/posts, http://0.0.0.0:3000/items, and http://0.0.0.0:3000/pets.

*** Using the gem in your own app requires putting "includes Umanage::SessionsHelper" in your app's application_controller.rb, in addition to mounting it in your routes.rb file. See appthing for examples.
