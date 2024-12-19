// Seed: 689222044
module module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input tri id_3,
    output wand id_4,
    input wire id_5,
    input wor id_6,
    input supply0 id_7,
    output uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri id_12,
    input tri id_13,
    input supply1 id_14,
    input wire id_15,
    input wire id_16,
    input tri1 id_17,
    input uwire id_18,
    input supply1 id_19
    , id_32,
    input wand id_20,
    output supply1 id_21,
    input supply0 id_22,
    input supply1 id_23,
    input tri id_24,
    input wor id_25,
    output tri1 id_26,
    input tri id_27,
    output wand id_28,
    input supply1 id_29,
    input wand id_30
);
  wire id_33, id_34;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    output wand  id_2
);
  wor id_4;
  always @(id_5 or posedge id_5 & id_4) id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_1,
      id_0,
      id_1,
      id_4
  );
endmodule
