// Seed: 676603061
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    output uwire id_3,
    input  wor   id_4,
    output tri   id_5,
    output tri   id_6
);
  supply1 id_8;
  id_9(
      .id_0(id_1 == 1), .id_1(id_8 == 1), .id_2(1), .id_3(), .id_4()
  );
  wire id_10 = id_10;
  wire id_11;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wand id_4,
    output tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    input supply0 id_9,
    output wire id_10,
    input tri1 id_11,
    output tri1 id_12,
    input tri id_13,
    output tri0 id_14,
    output wor id_15,
    input tri id_16,
    output wand id_17,
    output wand id_18,
    output supply0 id_19,
    input wor id_20,
    input wor id_21
    , id_26,
    input tri0 id_22,
    output supply0 id_23,
    input tri id_24
);
  wire id_27;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_6,
      id_14,
      id_2,
      id_19,
      id_19
  );
  assign modCall_1.type_13 = 0;
  id_28(
      .id_0(), .id_1(~(1 || id_9)), .find(1), .id_2(id_17), .id_3(), .id_4(id_20)
  );
  xor primCall (
      id_19, id_20, id_1, id_26, id_2, id_21, id_22, id_7, id_4, id_9, id_6, id_27, id_13
  );
  assign id_0 = 1 & id_26;
endmodule
