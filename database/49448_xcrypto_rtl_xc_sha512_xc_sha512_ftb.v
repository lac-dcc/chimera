// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


// TODO

module xc_sha512_ftb (

input clock,
input reset

);

reg [63:0] rs1   ; // Input source register 1
reg [ 1:0] ss    ; // Exactly which transformation to perform?
reg [63:0] result; // 

xc_sha512 i_xc_sha512 (
.rs1   (rs1   ), // Input source register 1
.ss    (ss    ), // Exactly which transformation to perform?
.result(result)  // 
);

endmodule

