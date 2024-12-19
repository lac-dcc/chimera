// Seed: 2467783205
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
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_11 = 1'h0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri id_3,
    output wand id_4,
    input wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wor id_8,
    input supply0 id_9,
    input tri1 id_10,
    input supply0 id_11
);
  wire id_13;
  wire id_14;
  assign id_3 = 0;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_14,
      id_14,
      id_14,
      id_14,
      id_13,
      id_13
  );
  uwire id_15 = 1'h0;
  nor primCall (id_3, id_6, id_10, id_9, id_5, id_1, id_0, id_11, id_8, id_13, id_7, id_14);
  always @(posedge 1) id_15 = 1;
endmodule
