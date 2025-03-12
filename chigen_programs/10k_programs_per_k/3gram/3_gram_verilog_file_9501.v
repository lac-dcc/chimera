// Seed: 1043859429
module module_0 (
    input tri id_0,
    output wire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    input tri id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    input supply1 id_11,
    input wire id_12,
    output wand id_13,
    input tri id_14,
    input supply1 id_15,
    input wor id_16,
    output wire id_17
);
endmodule
module module_1 (
    input  tri1 id_0,
    input  wand id_1,
    input  tri0 id_2,
    output tri0 id_3
);
  logic id_5;
  localparam id_6 = 1;
  xor primCall (id_3, id_2, id_6, id_0, id_1);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
