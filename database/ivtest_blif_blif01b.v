// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module test_logic(input A, B, output q_nand, q_nor, q_xnor, q_not);

   assign q_nand = A ~& B;
   assign q_nor  = A ~| B;
   assign q_xnor = A ~^ B;
   assign q_not  = ~A;

endmodule // test_logic
