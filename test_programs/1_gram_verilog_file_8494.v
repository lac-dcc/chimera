// Seed: 160509493
program module_0 (
    output tri0 id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    input wand id_11,
    output tri0 id_12,
    input supply0 id_13,
    input tri1 id_14,
    output wor id_15
);
  tri0 id_17;
  assign id_2 = 1 ? id_3 : 1;
  wire id_18;
  wire id_19;
  assign id_17 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    inout wor id_7,
    output wor id_8
);
  assign id_8 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0,
      id_7,
      id_1,
      id_1,
      id_6
  );
  assign modCall_1.type_4 = 0;
endmodule
