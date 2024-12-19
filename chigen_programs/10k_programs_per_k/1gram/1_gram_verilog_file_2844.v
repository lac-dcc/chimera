// Seed: 179697826
module module_0 (
    input supply0 id_0,
    output wand id_1,
    output wire id_2,
    output supply1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    output uwire id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input wor id_11
);
  wor  id_13;
  wire id_14;
  id_15(
      1, id_13, (id_13), 1, 1
  );
  supply1 id_16 = 1, id_17 = 1;
  assign id_4 = 1'd0;
  wire id_18;
  id_19(
      id_14 - ""
  );
  wire id_20;
  id_21(
      {1'b0}
  );
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    output wire id_2,
    input wor id_3,
    input tri0 id_4
    , id_20,
    input tri0 id_5,
    input tri0 id_6,
    output wand id_7,
    input wor id_8,
    output wor id_9,
    output supply0 id_10,
    output wor id_11,
    output wor id_12,
    output supply0 id_13,
    input tri1 id_14,
    output supply1 id_15,
    output tri0 id_16,
    output supply0 id_17,
    output uwire id_18
);
  wire id_21;
  nand primCall (id_12, id_21, id_4, id_20, id_14, id_1, id_6, id_5, id_8, id_3);
  module_0 modCall_1 (
      id_14,
      id_15,
      id_7,
      id_2,
      id_2,
      id_18,
      id_16,
      id_8,
      id_14,
      id_16,
      id_14,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
