* Noted:
   * Class Inheritance:  Inheriting the properties * and methods from one or more parent classes
   * Object Inheritance: Inheriting the properties and methods from one or more objects **  
   * The $inherit method allows a class to inherit all the properties and methods of the passed object type

* Example 1
   customer = new object("Customer") ;* object of class Customer
   sales = new object("Sales")       ;* object of class Sale

   transaction = new object("Transaction")
   *Transaction object will inherit all the methods and properties available to the customer and sales objects
   transaction->$inherit(customer, sales)
   * or
   transaction->$inherit("Customer", "Sales")

* Example 2

   * Class Customer
   method Customer::dothis()
      this->sometext = "This was called from sales::dothis()"
      return
   end method
   customer = new object("Customer")   ;* Allocate an object whose class name is 'customer'
   customer->name = "DS supplies"      ;* Create a 'name' property
   customer->town = "Hucknall"         ;* Create a 'town' property

   * Class Sales
   sales = new object("Sales", customer)         ;* Create a new object whose class name is Sales
   sales->order = 12345                          ;* Create an 'order' property
   sales->dothis()                               ;* There isn't a sales method called dothis(), but there IS one on customer

   print sales->$tojson(1)   ;* Display the 'sales' object which will have 3 properties

   *  We now need a constructor for Sales, one that allows us to inherit the properties and methods of the passed object.
   method Sales::Sales()
   * This is the constructor for the Sales class.
   * You can optionally pass one or more objects to inherit their properties.

      varg = new object("$vararg")    ;* Allocate a system object of class $vararg

   * The $vararg class allows you to process each argument passed to the method, one at a time.

      loop while varg->size() do      ;* For each argument that was passed
         nextvar = varg->next()      ;* Get the next argument
         this->$inherit(nextvar)     ;* Inherit the properties and methods.
      repeat
   end method

