// Seed: 2916695243
module module_0 (
    output wire  id_0,
    output tri1  id_1,
    input  wand  id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    input  tri   id_5,
    input  tri   id_6,
    output uwire id_7
);
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output wor id_2,
    output uwire id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    output tri id_7,
    input uwire id_8,
    input tri0 id_9,
    input wire id_10,
    input wor id_11,
    output tri0 id_12,
    input wire id_13,
    input wire id_14,
    input wand id_15,
    input wor id_16,
    input supply0 id_17,
    input uwire id_18,
    output wor id_19
);
  wire id_21 = id_14;
  supply1 ["" : -1] id_22 = 1;
  module_0 modCall_1 (
      id_2,
      id_19,
      id_1,
      id_4,
      id_9,
      id_11,
      id_4,
      id_12
  );
  assign modCall_1.id_2 = 0;
  supply1 [1 : -1] id_23 = "" != id_21;
  assign id_23 = "" == id_17;
endmodule
