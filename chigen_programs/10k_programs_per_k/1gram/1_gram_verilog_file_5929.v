// Seed: 3668277036
module module_0 #(
    parameter id_4 = 32'd8,
    parameter id_6 = 32'd16,
    parameter id_7 = 32'd82
) (
    id_1,
    id_2#(
        .id_3 (1),
        ._id_4(-1)
    ),
    id_5
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [-1 : id_4] _id_6, _id_7;
  wire id_8;
  ;
  wire [id_6 : id_7] id_9, id_10;
  wire id_11;
endmodule
module module_1 #(
    parameter id_3 = 32'd30
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input logic [7:0] id_7;
  output wire id_6;
  inout reg id_5;
  inout wire id_4;
  inout wire _id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  inout wire id_2;
  output wire id_1;
  always_latch id_5 <= id_7[id_3===-1][id_3 : 1'b0-1'b0];
endmodule
