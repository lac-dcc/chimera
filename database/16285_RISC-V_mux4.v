// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module mux4 #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH - 1 : 0] in0, in1, in2, in3,
    input [1:0] sel,
    output reg [DATA_WIDTH - 1 : 0] out
);

always @(*) begin
    case (sel)
        2'b00 : out = in0 ;
        2'b01 : out = in1;
        2'b10 : out = in2;
        2'b11 : out = in3;
    endcase
end
    
endmodule