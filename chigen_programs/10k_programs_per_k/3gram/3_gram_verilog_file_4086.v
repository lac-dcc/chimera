// Seed: 3784703021
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  tri0 id_8 = 1;
endmodule
macromodule module_1 (
    output tri1 id_0,
    input wire id_1,
    input wire id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    input wor id_6,
    input tri0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    input wor id_12,
    input wor id_13,
    input uwire id_14,
    input tri1 id_15,
    input supply1 id_16,
    output wor id_17,
    output wire id_18
);
  wire id_20;
  nand primCall (
      id_18, id_12, id_16, id_2, id_7, id_20, id_11, id_10, id_15, id_9, id_4, id_14, id_1
  );
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20,
      id_20,
      id_20,
      id_20,
      id_20
  );
  assign modCall_1.id_8 = 0;
endmodule
