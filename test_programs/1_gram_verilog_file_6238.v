// Seed: 2567174217
module module_0 (
    output tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    input wire id_8,
    input tri id_9,
    output uwire id_10,
    input uwire id_11,
    input wor id_12,
    input uwire id_13,
    output wor id_14,
    input tri id_15,
    input tri id_16,
    output supply0 id_17,
    input tri id_18
);
  wire id_20;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    input supply0 id_2,
    input wor id_3,
    input uwire id_4,
    output uwire id_5,
    input wand id_6,
    input tri0 id_7
);
  tri id_9, id_10;
  wire id_11, id_12, id_13;
  assign id_10 = id_6 !=? 1'b0;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_7,
      id_4,
      id_7,
      id_7,
      id_6,
      id_5,
      id_3,
      id_7,
      id_5,
      id_0,
      id_0,
      id_7,
      id_5,
      id_6,
      id_6,
      id_5,
      id_6
  );
  assign modCall_1.type_3 = 0;
endmodule
