// Seed: 3894013877
`define pp_10 0
`define pp_11 0
`define pp_12 0
`default_nettype id_6
`define pp_13 0
`timescale 1 ps / 1 ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout id_10;
  input id_9;
  input id_8;
  input id_7;
  inout id_6;
  output id_5;
  output id_4;
  inout id_3;
  inout id_2;
  output id_1;
  always @(posedge id_6)
    if (1'h0) id_6 <= id_10 && id_7;
    else begin
      id_10 <= id_2#(
          .id_8(id_3),
          .id_6((1))
      );
    end
  assign id_3 = id_8;
endmodule
