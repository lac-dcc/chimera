// Seed: 2890794094
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    input tri0 id_6,
    input tri id_7
    , id_15,
    input tri id_8,
    input wire id_9,
    input tri0 id_10,
    input supply0 id_11,
    output wire id_12,
    output wire id_13
);
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output tri1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    output wor id_7,
    input tri1 id_8,
    input uwire id_9,
    input supply1 id_10,
    input supply1 id_11,
    output wor id_12,
    output wire id_13,
    input wor id_14,
    input tri1 id_15,
    input supply0 id_16,
    input uwire id_17,
    input wire id_18,
    output wire id_19
);
  assign id_19 = id_1 ? id_15 || id_5 : 1'b0;
  xor primCall (
      id_12, id_11, id_14, id_10, id_8, id_16, id_17, id_9, id_4, id_15, id_0, id_5, id_1
  );
  module_0 modCall_1 (
      id_2,
      id_1,
      id_15,
      id_13,
      id_4,
      id_17,
      id_18,
      id_9,
      id_15,
      id_9,
      id_14,
      id_5,
      id_3,
      id_12
  );
endmodule
