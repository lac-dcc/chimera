// Seed: 3104318103
module module_0;
  reg id_1, id_2;
  initial @(posedge 1'b0) id_2 = #1 id_1;
  always_ff
    if (id_1) id_1 <= 1'b0;
    else disable id_3;
endmodule
module module_1 (
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
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_9;
  assign id_12[1'b0] = id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
