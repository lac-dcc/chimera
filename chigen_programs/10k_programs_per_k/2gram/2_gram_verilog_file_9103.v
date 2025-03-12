// Seed: 153998230
module module_0 (
    output tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    output supply0 id_3,
    input supply1 id_4,
    output wire id_5,
    input supply1 id_6,
    input supply0 id_7,
    output wor id_8,
    input wand id_9,
    input wor id_10,
    input tri0 id_11,
    input uwire id_12,
    output wor id_13,
    output uwire id_14
);
  wire id_16;
endmodule
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input wire id_2,
    input wor id_3,
    output wire id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wire id_8,
    input wor id_9,
    output tri0 id_10,
    output uwire id_11,
    output supply1 module_1,
    output tri id_13,
    input tri0 id_14,
    output tri id_15,
    input wor id_16,
    input wand id_17,
    input wand id_18,
    output supply1 id_19,
    output tri0 id_20,
    output uwire id_21,
    output wand id_22,
    input wand id_23
);
  wire id_25;
  assign id_21 = id_16;
  assign id_0  = id_25;
  or primCall (
      id_22, id_2, id_17, id_3, id_7, id_5, id_9, id_6, id_14, id_8, id_26, id_25, id_18, id_16
  );
  real id_26 = id_18;
  module_0 modCall_1 (
      id_21,
      id_1,
      id_3,
      id_13,
      id_23,
      id_19,
      id_8,
      id_18,
      id_4,
      id_9,
      id_3,
      id_5,
      id_18,
      id_4,
      id_22
  );
  assign modCall_1.id_14 = 0;
endmodule
