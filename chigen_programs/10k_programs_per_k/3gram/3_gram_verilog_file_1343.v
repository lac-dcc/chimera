// Seed: 1032308237
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  assign module_1.id_18 = 0;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_20;
endmodule
program module_1 #(
    parameter id_2 = 32'd72
) (
    id_1,
    _id_2,
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
    id_16,
    id_17,
    id_18
);
  inout supply1 id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  input logic [7:0] id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  xor primCall (id_5, id_11, id_8, id_9, id_17, id_15, id_3, id_7, id_18, id_14, id_12);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_3,
      id_5,
      id_12,
      id_15,
      id_12,
      id_12,
      id_17,
      id_7,
      id_4,
      id_15,
      id_3,
      id_18,
      id_15,
      id_13,
      id_18,
      id_7,
      id_11
  );
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  wire id_19;
  assign id_3 = id_14[id_2];
  assign id_18 = -1;
  assign id_9[1'b0] = -1;
endprogram
