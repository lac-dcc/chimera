// Seed: 826276546
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
    id_17
);
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wand id_18 = 1 ^ id_7 ^ 1;
  supply1 id_19, id_20, id_21, id_22;
  wire id_23;
  assign id_3 = id_7 == id_21;
  logic [7:0] id_24;
  assign id_11 = 1;
  wire id_25;
  wire id_26;
  always begin : LABEL_0
    id_24[1] = id_5 ? id_13 : 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_6,
      id_4,
      id_2,
      id_3,
      id_4,
      id_4,
      id_3,
      id_6
  );
  assign id_5[1] = id_4;
endmodule
