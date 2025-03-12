// Seed: 4283896677
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    output tri id_2,
    output tri module_0,
    output uwire id_4,
    input wire id_5,
    input wor id_6,
    input wire id_7,
    input supply1 id_8,
    output tri0 id_9,
    output wand id_10,
    input wire id_11,
    output uwire id_12,
    input wor id_13,
    input uwire id_14,
    input wand id_15,
    input supply1 id_16,
    input tri1 id_17
);
  assign id_4 = |id_8;
  timeprecision 1ps;
  assign module_1.id_9 = 0;
  assign id_0 = 1;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output tri id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7,
    output supply0 id_8,
    input wire id_9,
    input wire id_10,
    input uwire id_11,
    input supply0 id_12,
    input wand id_13,
    input tri0 id_14,
    output wor id_15,
    input wire id_16,
    input supply0 id_17,
    input tri1 id_18
);
  assign id_8 = id_1++;
  xor primCall (id_8, id_11, id_13, id_2, id_5, id_0, id_10, id_14, id_6, id_9, id_3, id_18);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_1,
      id_4,
      id_1,
      id_3,
      id_17,
      id_9,
      id_2,
      id_8,
      id_8,
      id_17,
      id_15,
      id_6,
      id_11,
      id_10,
      id_16,
      id_7
  );
endmodule
