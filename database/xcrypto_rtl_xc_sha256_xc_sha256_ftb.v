
// TODO

module xc_sha256_ftb (

input clock,
input reset

);

reg [31:0] rs1   ; // Input source register 1
reg [ 1:0] ss    ; // Exactly which transformation to perform?
reg [31:0] result; // 

xc_sha256 i_xc_sha256 (
.rs1   (rs1   ), // Input source register 1
.ss    (ss    ), // Exactly which transformation to perform?
.result(result)  // 
);

endmodule
