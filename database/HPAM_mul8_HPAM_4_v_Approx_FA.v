// This program was cloned from: https://github.com/clowdur/HPAM_mul8
// License: MIT License

// Approximate Full Adder
// synthesizable
// Oliver Huang and Jared Yoder

module Approx_FA (output carry, output sum, input a, input b, input cin);

    // instantiating sum and carry primitives
    assign carry = (a & b);
    assign sum = (a ^ b ^ cin);
endmodule


// primitive carryOut (output Cout, input A, input B, input Cin);

//     // Truth Table for approximate carry out
//     table
//       // A B Cin    Cout
//          1 1  ?   :  1  ;
//          1 0  ?   :  0  ;
//          0 1  ?   :  0  ;
//          0 0  ?   :  0  ;
//     endtable
// endprimitive

// primitive sumOut (output sum, input A, input B, input Cin);

//     // Truth Table for sum
//     table
//       // A B Cin    sum
//          1 1  1   :  1  ;
//          1 0  0   :  1  ;
//          0 1  0   :  1  ;
//          0 0  1   :  1  ;
//          0 0  0   :  0  ;
//          0 1  1   :  0  ;
//          1 0  1   :  0  ;
//          1 1  0   :  0  ;
//     endtable
// endprimitive

// module FA(output Cout, output sum, input A, input B, input Cin);

//     // instantiating sum and carry primitives
//     sumOut s(sum, A, B, Cin);
//     carryOut co(Cout, A, B, Cin);
// endmodule

