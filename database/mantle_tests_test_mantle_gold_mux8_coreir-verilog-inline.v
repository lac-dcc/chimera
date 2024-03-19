module Mux8xNone (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input [2:0] S,
    output O
);
reg [0:0] coreir_commonlib_mux8x1_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux8x1_inst0_out = I0;
end else if (S == 1) begin
    coreir_commonlib_mux8x1_inst0_out = I1;
end else if (S == 2) begin
    coreir_commonlib_mux8x1_inst0_out = I2;
end else if (S == 3) begin
    coreir_commonlib_mux8x1_inst0_out = I3;
end else if (S == 4) begin
    coreir_commonlib_mux8x1_inst0_out = I4;
end else if (S == 5) begin
    coreir_commonlib_mux8x1_inst0_out = I5;
end else if (S == 6) begin
    coreir_commonlib_mux8x1_inst0_out = I6;
end else begin
    coreir_commonlib_mux8x1_inst0_out = I7;
end
end

assign O = coreir_commonlib_mux8x1_inst0_out[0];
endmodule

