// Seed: 676348578
`timescale 1 ps / 1 ps
module module_0 #(
    parameter id_1  = 32'd62,
    parameter id_10 = 32'd27,
    parameter id_12 = 32'd90
) (
    input logic id_2,
    output logic id_3,
    output id_4,
    output id_5,
    input logic id_6,
    input id_7,
    output id_8,
    input id_9,
    input _id_10,
    input id_11,
    input logic _id_12,
    output id_13
);
  assign id_4 = id_2;
  always @(posedge id_9 or posedge 1) begin
    id_12 = id_12[id_1[id_10 : 1] : {id_12{1}}] * id_6[1+:1'b0];
  end
endmodule
