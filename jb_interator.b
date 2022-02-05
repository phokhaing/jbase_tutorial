* NOTED:
   * $iterator is a constructor for the Iterator class. 
   * When an object of this type is created, it allows you to iterate (loop) through all keys and values in an object or array.

* Example 1

   ** Iterate through an array:
   equ beautify to 5  ;* format $tojson() output using 4 spaces for indentation levels
   types = new array
   types->$append("Space the Final Frontier")    ;* string
   types->$append(42)                            ;* integer
   types->$append(123.4)                         ;* numeric
   types->$setboolean("-1", @true)     ;* append a "boolean"
   types->$setboolean("-1", @false)    ;* append a "boolean"
   types->$setnull("-1")               ;* append a "null" value

   crt types->$tojson(beautify)                  ;* format json

   iter = new object("$iterator", types)         ;* create the iterator object

   nextkey = ""; nextvalue = ""; nexttype = ""   ;* Keeps the compiler from complaining
   loop while iter->next(nextkey , nextvalue , nexttype) do
      crt "Key ":dquote(nextkey):" has value ":dquote(nextvalue):" and type ":dquote(nexttype)
   repeat

   * Result:
      * crt types->$tojson(beautify)
      * [
      *    "Space the Final Frontier",
      *    42,
      *    123.4,
      *    true,
      *    false,
      *    null
      * ]

      * loop result: 
      * Key "0" has value "Space the Final Frontier" and type "string"
      * Key "1" has value "42" and type "integer"
      * Key "2" has value "123.4" and type "numeric"
      * Key "3" has value "1" and type "boolean"
      * Key "4" has value "0" and type "boolean"
      * Key "5" has value "" and type "null"


* Example 2

   ** iterating through an object
   equ beautiful to 5 ;*space 5 inden formatter json data
   obj = new object
   obj->id = 0001
   obj->name = "Pho Khaing"
   obj->$setboolean("true", @true)
   obj->@setboolean("false", @false)
   obj->@setnull("northing_there")

   * format json
   Crt obj->$tojson(beautiful)

   iter = obj->$interator() ;** for create interator object

   * varaible
   index = "";
   value = "";
   type = "";

   * while loop iter
   Loop While iter->Next(index, value, type) Do
      * print result
      Crt "Index":Dquote(index): "Value":Dquote(value): "Data Type":Dquote(type)

   Repeat

   *  Result:
      * Crt obj->$tojson(beautiful)
      [
         "id": 0001,
         "name": "Pho Khaing",
         "true": true,
         "false": false,
         "northing_null": null
      ]
      
      * loop result:
      Index "0" Value "0001" Type "String"
      Field "1" Value "Pho Khaing" Type "String"
      Field "2" Value "true" Type "boolean"
      Field "3" Value "false" Type "boolean"
      Field "4" Value "" Type "null"


   * For loop
   For property in obj setting aux
      crt "Property: ":property
      crt "Key:      ":aux->key
      crt "Type:     ":aux->type
      crt
   next
   
   * Result:
   Property: Hello
   Key:      greeting
   Type:     string

   Property: 42
   Key:      the_answer
   Type:     number

   Property:
   Key:      nothing
   Type:     null

   Property: 1
   Key:      true
   Type:     boolean


