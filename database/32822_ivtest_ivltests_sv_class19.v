// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


/*
 * This tests a trivial class. This tests that simple property
 * initializers work, but are overridden by an constructor. It
 * also tests the global const property.
 */
program main;

   // Trivial examples of classes.
   class foo_t ;
      static int int_incr = 1;
      int       int_value = 42;

      function new();
	 // The declaration assignments happen before the constructor
	 // is called, so we can refer to them.
	 int_value = int_value + int_incr; // s.b. 43
      endfunction
   endclass : foo_t // foo_t

   foo_t obj1;
   foo_t obj2;

   initial begin

      // Static properties do not actually look at the instance, so
      // we do not need to create an instance to access them.
      if (obj1.int_incr !== 1) begin
	 $display("FAILED == obj1.int_incr=%0d.", obj1.int_incr);
	 $finish;
      end

      obj1 = new;

      if (obj1.int_value !== 43) begin
	 $display("FAILED -- obj1.int_value=%0d.", obj1.int_value);
	 $finish;
      end

        // Try a shallow copy to see that the const propery is handled.
      obj2 = new obj1;
      if (obj2.int_value !== 43) begin
	 $display("FAILED -- obj2.int_value=%0d.", obj2.int_value);
	 $finish;
      end

      obj1.int_incr = 2;
      if (obj1.int_incr !== 2) begin
	 $display("FAILED == obj1.int_incr=%0d", obj1.int_incr);
	 $finish;
      end
      if (obj2.int_incr !== 2) begin
	 $display("FAILED == obj2.int_incr=%0d", obj2.int_incr);
	 $finish;
      end

      $display("PASSED");
      $finish;
   end
endprogram // main
