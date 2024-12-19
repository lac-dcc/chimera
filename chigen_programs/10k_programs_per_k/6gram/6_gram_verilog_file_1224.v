// Seed: 1948530165
module module_0 (
    input wire id_0,
    output wand id_1,
    output tri id_2,
    input wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    output uwire id_8,
    input uwire id_9,
    output wor id_10,
    input wor id_11,
    output uwire id_12,
    input uwire id_13,
    input uwire id_14,
    output supply0 id_15,
    output tri id_16,
    input tri id_17
    , id_26,
    input supply0 id_18,
    input supply1 id_19,
    input tri id_20,
    input wor id_21,
    output tri1 id_22,
    input tri id_23
    , id_27,
    input wand id_24
);
  supply1 id_28 = 1;
  wire id_29;
  wire id_30;
  assign id_4 = id_21;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    output wand id_3,
    output supply0 id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    output tri id_8,
    input wire id_9
);
  integer id_11;
  xnor primCall (id_4, id_9, id_0, id_1);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_9,
      id_8,
      id_1,
      id_6,
      id_6,
      id_3,
      id_6,
      id_3,
      id_9,
      id_4,
      id_0,
      id_1,
      id_4,
      id_3,
      id_7,
      id_0,
      id_1,
      id_0,
      id_9,
      id_4,
      id_7,
      id_6
  );
endmodule
