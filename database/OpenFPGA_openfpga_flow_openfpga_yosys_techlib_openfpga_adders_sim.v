// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

//---------------------------------------
// 1-bit adder 
//---------------------------------------
(* abc9_box, lib_whitebox *)
module adder(
    output sumout,
    output cout,
    input a,
    input b,
    input cin
);
    assign sumout = a ^ b ^ cin;
    assign cout = (a & b) | ((a | b) & cin);

endmodule
