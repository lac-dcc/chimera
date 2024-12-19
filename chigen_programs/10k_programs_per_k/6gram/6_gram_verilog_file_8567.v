// Seed: 1618271640
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    output wand id_5,
    input tri0 id_6,
    input tri1 id_7,
    output supply0 id_8,
    output tri id_9,
    input supply0 id_10,
    input wor id_11,
    input wand id_12,
    input supply1 id_13,
    input tri0 id_14,
    input uwire id_15,
    input wand id_16,
    input supply0 id_17,
    input supply1 id_18,
    input wire id_19,
    input supply1 id_20,
    output supply1 id_21,
    output wor id_22,
    input tri id_23,
    input uwire id_24,
    input wand id_25,
    output tri id_26,
    input supply0 id_27,
    input tri1 id_28,
    output uwire id_29
);
  wire id_31;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1,
    output supply1 id_2,
    output supply0 id_3
);
  wor id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5,
      id_5,
      id_0,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0,
      id_5,
      id_3,
      id_2,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0,
      id_0,
      id_2
  );
  assign id_5 = id_0;
  assign id_3 = (1) || 1;
endmodule
