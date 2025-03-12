// Seed: 405750189
module module_0 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3
    , id_27,
    input tri id_4,
    input wand id_5,
    input wire id_6,
    output wor id_7,
    input uwire id_8,
    output uwire id_9,
    input uwire id_10,
    output supply0 id_11,
    input tri id_12,
    input tri id_13,
    input supply1 id_14,
    output wire id_15,
    output wire id_16,
    input tri1 id_17,
    output supply0 id_18,
    input supply1 id_19,
    input wand id_20,
    input supply1 id_21,
    output supply0 id_22,
    output supply1 id_23,
    output tri id_24,
    output wor id_25
);
  wire id_28;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    output wire id_2,
    input wand id_3,
    input supply0 id_4
);
  wire id_6;
  xnor primCall (id_0, id_4, id_3, id_6, id_1);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_1,
      id_3,
      id_4,
      id_0,
      id_3,
      id_0,
      id_4,
      id_0,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_0,
      id_2,
      id_0
  );
endmodule
