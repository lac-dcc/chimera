// Seed: 1634829055
module module_0 (
    output wand id_0,
    input tri id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wand id_5,
    input wand id_6,
    input wand id_7,
    output supply0 id_8,
    input wor id_9,
    input tri id_10,
    input tri id_11,
    input wor id_12,
    input uwire id_13,
    input uwire id_14,
    input wand id_15,
    input tri0 id_16,
    input wor id_17,
    output wire id_18,
    output wire id_19,
    input tri id_20,
    input tri id_21,
    input tri0 id_22,
    input tri1 id_23,
    input tri1 id_24,
    output tri0 id_25,
    input wand id_26,
    output supply1 id_27
    , id_29
);
  wire id_30;
  assign id_18 = 1;
  assign id_8  = 1;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wand id_3,
    input tri1 id_4,
    input wire id_5,
    input tri id_6,
    input tri0 id_7,
    output supply1 id_8,
    output tri0 id_9
);
  logic [1 : "" ==  1] id_11;
  nor primCall (id_9, id_0, id_2, id_5, id_6, id_7, id_11, id_3, id_4, id_1);
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6,
      id_6,
      id_9,
      id_6,
      id_3,
      id_5,
      id_6,
      id_3,
      id_4,
      id_4,
      id_3,
      id_7,
      id_8,
      id_8,
      id_0,
      id_2,
      id_4,
      id_3,
      id_6,
      id_8,
      id_5,
      id_9
  );
  assign modCall_1.id_12 = 0;
endmodule
