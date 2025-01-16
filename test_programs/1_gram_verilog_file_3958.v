// Seed: 1701549341
module module_0 (
    input tri1 id_0,
    input tri id_1,
    id_25,
    output tri1 id_2,
    output wire id_3,
    input wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    input wire id_12,
    output tri0 id_13,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    output tri id_17,
    input tri id_18,
    output supply0 id_19,
    output uwire id_20,
    input uwire id_21,
    input uwire id_22,
    input wor id_23
);
  assign id_17 = id_14;
  assign module_1.type_0 = 0;
endmodule
macromodule module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    output uwire id_3,
    input  tri1  id_4,
    input  wor   id_5,
    inout  tri0  id_6,
    output uwire id_7,
    input  wire  id_8,
    output uwire id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_9,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_5,
      id_6,
      id_3,
      id_2,
      id_4,
      id_8,
      id_3,
      id_4,
      id_7,
      id_7,
      id_2,
      id_1,
      id_4
  );
  uwire id_11 = id_6, id_12;
endmodule
