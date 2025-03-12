// Seed: 3546537532
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    output uwire id_5,
    input wand id_6,
    output wor id_7,
    output tri1 id_8,
    output supply1 id_9,
    output wire id_10,
    output supply0 id_11,
    output supply0 id_12,
    input wire id_13,
    input tri1 id_14,
    input supply0 id_15,
    input wire id_16,
    input wor id_17,
    input uwire id_18,
    output tri id_19,
    input wand id_20,
    input wor id_21,
    input wire id_22,
    output tri0 id_23,
    output wand id_24
);
  assign id_8 = id_20;
  assign id_23 = id_14;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  tri0  id_3
);
  logic id_5 = ~id_3;
  always @(id_2 - 'b0 or posedge -1) id_5 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_0,
      id_3,
      id_2,
      id_1,
      id_1
  );
endmodule
