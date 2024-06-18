// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test (D);

   input D;

   prim  p (a, D, D, D);

endmodule

primitive prim (Z, A, B, S);

   output Z;
   input  A, B, S;

   table
         0  0  x  :  0  ;
   endtable

endprimitive
