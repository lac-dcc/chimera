// Seed: 1984997219
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    input supply1 id_7,
    input wand id_8,
    output wand id_9,
    input tri id_10
    , id_12
);
  wire id_13;
endmodule
module module_1 (
    input supply0 id_0,
    inout wand id_1,
    input tri id_2,
    output wand id_3,
    input tri0 id_4,
    output uwire id_5,
    output tri id_6,
    output tri0 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input wor id_10,
    output uwire id_11
    , id_16,
    output tri1 id_12,
    output uwire id_13,
    output uwire id_14
);
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_10,
      id_1,
      id_1,
      id_8,
      id_4,
      id_0,
      id_14,
      id_2
  );
  assign modCall_1.type_15 = 0;
  initial begin : LABEL_0
    id_13 = id_1;
    id_3  = id_4;
  end
  wire id_17;
  assign id_3 = id_8;
  xor primCall (id_12, id_16, id_2, id_8, id_0, id_1, id_10, id_4, id_9);
endmodule
