
* The general form of a method is:
   method Classname::{~}methodname({arguments})
      ...method body...
      {return {value}}
   end method
* *

** NOTED:

   * 1. If methodname is the same as Classname then this is the Constructor for the Class.
      * ex: constructor method
         method Circle::Circle(radius)       ;* constructor
            self->radius = radius
         end method
      * A Constructor is a special method that runs when an instance of a Class is created.
      
   * 2. If methodname = ~Classname then this is the Destructor for the Class. 
      * A Destructor is a special method that runs when the lifetime of an object ends. This event happens automagically:
      method Owner::~Owner()    ;* Destructor
        crt
        crt "I've been destroyed!"
      end method

   * 3. If no value is to be returned then the return statement is optional.
      method Math::Math()  ;* constructor
        this->pi = 3.14159
      end method

   * 4. Methods that return a value can call other methods in a chain-like fashion.
      method Math::circumference(radius)
        return (this->pi * 2) * radius
      end method

   * 5. A program's local variable names will not conflict with the names of properties of an object.


* Example 1:
   $option jabba
   method Math::Math()  ;* constructor
      this->pi = 3.14159
   end method

   method Math::circumference(radius)
      return (this->pi * 2) * radius
   end method

   precision 6
   circle = new object("Math");* create new obj call Math class
   radius = 5
   crt "The circumference of our circle with a radius of ":radius:" is ":circle->circumference(radius):" units."

* Example 2
   $option jabba

   * Owner methods
   method Owner::Owner(name)  ;* Constructor for the Owner class
      this->name = name
   end method

   method Owner::feed(pets)
      return pets
   end method

   method Owner::~Owner()  ;* Destructor
      crt
      crt "I've been destroyed!"
   end method

   * Pets methods
   method Pets::Pets()  ;* Constructor
      args = new object("$vararg")
      pets = new array
      crt args->size()
      loop while args->size() do
         pets->$append(args->next()) ;* alternatively: pets[-1] = args->next()
      repeat
      this = pets
   end method
