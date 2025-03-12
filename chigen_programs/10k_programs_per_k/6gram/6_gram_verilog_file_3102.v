// Seed: 3621693544
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  assign module_1.id_8 = 0;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic
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
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26;
endmodule
module module_1 #(
    parameter id_8 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire _id_8;
  inout wire id_7;
  inout wand id_6;
  output wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_1,
      id_9,
      id_4,
      id_9,
      id_6,
      id_6
  );
  output wire id_3;
  xor primCall (id_6, id_9, id_4, id_7);
  output wire id_2;
  output wire id_1;
  assign id_6 = -1 ? -1 : id_4 ? 1 : id_4;
  wire [id_8  ==  id_8 : 1 'b0] id_11;
  wire id_12;
endmodule
