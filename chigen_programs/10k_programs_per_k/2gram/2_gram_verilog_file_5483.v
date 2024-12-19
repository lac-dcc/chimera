// Seed: 138022255
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input uwire id_4,
    output tri1 id_5,
    input wire id_6,
    input tri1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input wand id_11,
    input wire id_12,
    output tri0 id_13,
    output wor id_14,
    input tri1 id_15,
    input tri0 id_16,
    input tri1 id_17,
    input wand id_18,
    input supply1 id_19
    , id_25, id_26,
    input tri id_20,
    input wor id_21,
    input tri1 id_22,
    input wand id_23
);
  wire id_27;
  wire id_28;
  assign module_1.type_18 = 0;
  wire id_29;
  assign id_29 = id_23;
  wire id_30;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri id_4,
    output supply0 id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    input supply1 id_10,
    output wor id_11,
    output tri0 id_12,
    input supply1 id_13,
    input supply1 id_14,
    output uwire id_15,
    output wire id_16
);
  nor primCall (id_6, id_14, id_2, id_10, id_13, id_7, id_1, id_4, id_3, id_8);
  module_0 modCall_1 (
      id_4,
      id_8,
      id_6,
      id_1,
      id_1,
      id_5,
      id_8,
      id_1,
      id_2,
      id_7,
      id_4,
      id_14,
      id_10,
      id_0,
      id_0,
      id_2,
      id_2,
      id_7,
      id_1,
      id_4,
      id_14,
      id_7,
      id_3,
      id_14
  );
endmodule
