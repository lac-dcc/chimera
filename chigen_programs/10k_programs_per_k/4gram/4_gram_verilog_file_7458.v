// Seed: 3552582756
module module_0 (
    input uwire id_0,
    input wand id_1,
    output supply0 id_2,
    input tri id_3,
    input wor id_4,
    output uwire id_5,
    input wor id_6,
    input uwire id_7,
    input tri id_8,
    output supply0 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri0 id_12,
    input tri id_13,
    output supply0 id_14,
    input tri0 id_15,
    input wor id_16,
    input wor id_17,
    input supply0 id_18,
    output uwire id_19,
    input tri id_20,
    input supply1 id_21,
    output tri id_22
);
  wire id_24;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1
    , id_10, id_11,
    output supply1 id_2,
    output tri0 id_3,
    output uwire id_4,
    output wor id_5,
    input supply1 id_6,
    output wire id_7
    , id_12,
    output uwire id_8
);
  assign id_7 = -1;
  assign id_11[1'd0] = id_1;
  or primCall (id_3, id_6, id_11, id_10, id_1);
  module_0 modCall_1 (
      id_6,
      id_1,
      id_7,
      id_1,
      id_1,
      id_4,
      id_6,
      id_6,
      id_1,
      id_0,
      id_1,
      id_5,
      id_1,
      id_6,
      id_2,
      id_6,
      id_1,
      id_6,
      id_1,
      id_2,
      id_1,
      id_6,
      id_3
  );
endmodule
