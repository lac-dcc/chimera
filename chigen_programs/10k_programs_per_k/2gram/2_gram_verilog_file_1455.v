// Seed: 1970283024
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wire id_4,
    input wand id_5,
    input tri id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wor id_9,
    input wor id_10,
    output uwire id_11
    , id_19,
    input wor id_12,
    output tri1 id_13,
    input supply1 id_14,
    input tri0 id_15,
    input tri id_16,
    input tri1 id_17
);
  wire id_20;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input wire id_2,
    input tri id_3,
    input wand id_4,
    input supply0 id_5,
    input wire id_6,
    input uwire id_7,
    input supply1 id_8,
    input wor id_9,
    input wor id_10,
    input supply1 id_11
);
  wire id_13;
  nand primCall (id_1, id_10, id_2, id_3, id_5, id_0);
  module_0 modCall_1 (
      id_11,
      id_1,
      id_8,
      id_5,
      id_1,
      id_9,
      id_7,
      id_10,
      id_1,
      id_8,
      id_5,
      id_1,
      id_6,
      id_1,
      id_8,
      id_7,
      id_7,
      id_8
  );
  assign modCall_1.type_23 = 0;
endmodule
