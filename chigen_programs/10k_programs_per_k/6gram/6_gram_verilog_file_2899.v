// Seed: 2570637832
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
    id_15
);
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
  assign module_1.type_3 = 0;
  assign id_7 = id_12 == id_1;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    output supply0 id_2,
    input wand id_3,
    input tri0 id_4,
    input uwire id_5
);
  wire id_7;
  xor primCall (id_2, id_8, id_7, id_0);
  wire id_8, id_9;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_9,
      id_9,
      id_8,
      id_7,
      id_10,
      id_10,
      id_9,
      id_8,
      id_7,
      id_10,
      id_9,
      id_9
  );
  uwire id_11;
  always @(posedge 1 or posedge id_3) id_11 = 1 + 1 & 1;
endmodule
