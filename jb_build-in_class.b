Program

   * Dynamic jbase build-in class start with "$"

   * $development
   * $file
   * $global
   * $jbase
   * $lock
   * $system
   * $terminal
   * $vararg

   $option jabba,self
   * Circle class
   method Circle::Circle(radius)       ;* constructor
      self->radius = radius
   end method

   method Circle::area()
      return self->pi() * pwr(self->radius, 2)
   end method

   method Circle::circumference()
      return (2 * self->pi()) * self->radius
   end method

   * object call Circle class method
   radius = sentence(1)     ;* Grab the radius from the command line
   if not(num(radius)) or radius lt 1 then radius = 1
   *
   * Create a Circle object
   *
   mycircle = new object("Circle", radius)      ;* Create a circle object, then call the methods on it
   crt "The area of a circle with radius of ":radius:" is ":mycircle->area():" units."
   crt "The circumference of a circle with radius of ":radius:" is ":mycircle->circumference():" units."

End