// Seed: 3992751825
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [1 'h0 : 1] id_5;
  localparam integer id_6 = 1;
endmodule
module module_1 #(
    parameter id_14 = 32'd42
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_12,
      id_3
  );
  inout logic [7:0] id_15;
  input wire _id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_8 = id_15[id_14];
  id_18 :
  assert property (@(negedge -1 or posedge -1) id_13)
  else;
  assign id_15 = id_12;
endmodule
