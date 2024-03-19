module Mux4xNone (
    input I0,
    input I1,
    input I2,
    input I3,
    input [1:0] S,
    output O
);
reg [0:0] coreir_commonlib_mux4x1_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux4x1_inst0_out = I0;
end else if (S == 1) begin
    coreir_commonlib_mux4x1_inst0_out = I1;
end else if (S == 2) begin
    coreir_commonlib_mux4x1_inst0_out = I2;
end else begin
    coreir_commonlib_mux4x1_inst0_out = I3;
end
end

assign O = coreir_commonlib_mux4x1_inst0_out[0];
endmodule

