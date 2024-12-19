// Seed: 2388168499
program module_0 (
    output tri1 id_0,
    output tri1 id_1,
    input tri id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    output wor id_6,
    input uwire id_7,
    input wor id_8,
    input supply1 id_9,
    input wor id_10,
    input tri1 id_11,
    input wor id_12,
    input supply0 id_13,
    input supply0 id_14,
    input tri1 id_15,
    output wor id_16,
    input tri1 id_17,
    input supply1 id_18
);
  assign id_0 = id_8;
  wor id_20 = 1;
endprogram
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    input wire id_4,
    output wire id_5
);
  wand id_7 = id_0;
  wor  id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_0,
      id_7,
      id_4,
      id_5,
      id_7,
      id_3,
      id_3,
      id_0,
      id_0,
      id_7,
      id_3,
      id_2,
      id_2,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.type_28 = 0;
  tri id_9, id_10;
  wire id_11;
  assign id_10 = 1;
  wire id_12;
  assign id_8 = id_10;
  wire id_13 = id_11;
endmodule
