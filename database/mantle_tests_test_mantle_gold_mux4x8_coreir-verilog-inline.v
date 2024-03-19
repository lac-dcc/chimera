module Mux4x8 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    input [1:0] S,
    output [7:0] O
);
reg [7:0] coreir_commonlib_mux4x8_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux4x8_inst0_out = I0;
end else if (S == 1) begin
    coreir_commonlib_mux4x8_inst0_out = I1;
end else if (S == 2) begin
    coreir_commonlib_mux4x8_inst0_out = I2;
end else begin
    coreir_commonlib_mux4x8_inst0_out = I3;
end
end

assign O = coreir_commonlib_mux4x8_inst0_out;
endmodule

