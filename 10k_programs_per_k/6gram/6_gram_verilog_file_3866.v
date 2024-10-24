// Seed: 770294725
`default_nettype id_6
`define pp_7 0
`define pp_8 0
`define pp_9 0
`define pp_10 0
`define pp_11 0
`define pp_12 0
`define pp_13 0
`define pp_14 0
`define pp_15 0
`define pp_16 0
`define pp_17 0
`define pp_18 0
`define pp_19 0
`define pp_20 0
module module_0 #(
    parameter id_2 = 32'd65
) (
    input id_0,
    input id_1,
    input _id_2,
    input logic id_3,
    input id_4,
    input logic id_5,
    output id_6
);
  always @(*) begin
    SystemTFIdentifier({1, 1, id_0 & 1 - 1}, id_4);
    if (1) begin
      id_6 <= id_1;
    end else if (1'b0) assign id_6[1 : id_2] = id_1;
  end
endmodule
`define pp_21 0
`celldefine `timescale 1ps / 1ps
module module_1;
  assign id_6 = 1;
  logic id_7;
  type_9(
      1, 1, 1'd0
  );
endmodule
