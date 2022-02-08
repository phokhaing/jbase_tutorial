Program
   * Object Creation
   $option jabba
   my_obj = new object('Classname', arg1)
   
   my_array = new array("Arrayname")

   * object
   obj = new object
   obj = new object()
   obj = new object("")
   obj = mew object("$jbase")

   * array
   arr = new array
   arr = new array()
   arr = new array("")
   arr = new array("$jbase")

   * json
   json = \{"AnswerToLifeTheUniversAndEverything":42}\
   the_answer = json->$fromjson() ;* Create an object with the built-in $fromjson() method
   crt the_answer->$objecttype()  ;* Displays "object"
   crt the_answer->$tojson()      ;* Displays the original json string



End