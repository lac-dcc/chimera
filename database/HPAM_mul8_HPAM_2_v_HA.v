// This program was cloned from: https://github.com/clowdur/HPAM_mul8
// License: MIT License

// Half Adder
// synthesizable
// Oliver Huang and Jared Yoder

module HA (output carry, output sum, input a, input b);

    // instantiating sum and carry primitives
    assign carry = a & b;
    assign sum = a ^ b;
endmodule

// primitive outSum(output sum, input A, input B);

//     // Truth Table for sum
//     table
//       // A B   sum
//          0 0 :  0  ;
//          0 1 :  1  ;
//          1 0 :  1  ;
//          1 1 :  0  ;
//     endtable
// endprimitive

// primitive outCarry(output carry, input A, input B);

//     // Truth Table for carry out
//     table
//       // A B  carry
//          0 0 :  0  ;
//          0 1 :  0  ;
//          1 0 :  0  ;
//          1 1 :  1  ;
//     endtable
// endprimitive

// module HA (output carry, output sum, input A, input B);

//     // instantiating sum and carry primitives
//     outSum s(sum, A, B);
//     outCarry c(carry, A, B);
// endmodule