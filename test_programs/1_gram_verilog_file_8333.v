// Seed: 539409744
module module_0 (
    input wor id_0,
    input tri0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    input wire id_7,
    input tri id_8,
    output tri0 id_9,
    output wor id_10,
    output supply0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    input wand id_14,
    input uwire id_15,
    output supply1 id_16,
    output tri id_17,
    output wire id_18,
    output tri0 id_19,
    input tri1 id_20,
    input uwire id_21,
    output tri0 id_22
);
  tri1 id_24 = id_21;
  assign id_17 = -1;
  integer id_25;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    inout wor id_2,
    input supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri0 id_7
);
  wand id_9;
  nor primCall (id_2, id_3, id_6, id_7, id_5, id_4, id_9, id_0, id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_9,
      id_9,
      id_9,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_9,
      id_9,
      id_5,
      id_1,
      id_3,
      id_0,
      id_2,
      id_9,
      id_9,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_1 = 0;
  assign id_2 = id_9;
  assign id_2 = 1;
  assign id_2 = -1;
endmodule
