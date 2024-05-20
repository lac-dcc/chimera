// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module MUX (
    input wire [2:0] option,
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [31:0] C,
    input wire [31:0] D,
    input wire [31:0] E,
    input wire [31:0] F,
    input wire [31:0] G,
    input wire [31:0] H,
    output wire [31:0] S
);

assign S = (option == 3'b000) ? A :
           (option == 3'b001) ? B :
           (option == 3'b010) ? C :
           (option == 3'b011) ? D :
           (option == 3'b100) ? E :
           (option == 3'b101) ? F :
           (option == 3'b110) ? G :
           (option == 3'b111) ? H :
           A;  // Default case

endmodule
