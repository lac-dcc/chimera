// Seed: 126927726
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wor id_4,
    output tri1 id_5,
    output wand id_6,
    output uwire id_7,
    input supply1 id_8,
    input wor id_9,
    output wor id_10,
    input supply1 id_11,
    input wire id_12,
    input tri1 id_13,
    input uwire id_14,
    input supply1 id_15,
    input wor id_16,
    input tri id_17,
    output tri id_18,
    input tri1 id_19,
    output supply1 id_20,
    output wand id_21,
    output wor id_22,
    input supply0 id_23,
    output wand id_24
    , id_26
);
  wire id_27;
  assign module_1.type_3 = 0;
  wire id_28;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input tri id_2,
    input tri id_3,
    output supply1 id_4,
    input supply0 id_5
    , id_7
);
  wire id_8;
  xor primCall (id_4, id_3, id_10, id_9, id_2, id_5, id_0);
  wire id_9;
  assign id_1 = 1;
  wire id_10;
  wire id_11, id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_5,
      id_1,
      id_4,
      id_4,
      id_1,
      id_5,
      id_0,
      id_1,
      id_5,
      id_2,
      id_0,
      id_2,
      id_0,
      id_5,
      id_0,
      id_4,
      id_2,
      id_1,
      id_1,
      id_4,
      id_5,
      id_4
  );
endmodule
