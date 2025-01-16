// Seed: 3361885100
module module_0 (
    output tri id_0,
    input wor id_1,
    input tri id_2,
    output wand id_3,
    output wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input wand id_12,
    id_27,
    input tri0 id_13,
    output wor id_14,
    input supply1 id_15,
    output tri0 id_16,
    input wand id_17,
    input wand id_18,
    input wand id_19,
    output wire id_20,
    input wire id_21,
    input tri id_22,
    output tri id_23,
    input tri0 id_24,
    input tri1 id_25
);
  assign id_0 = id_10;
  wire id_28;
  wire id_29, id_30;
  initial begin : LABEL_0
    id_16 = 1;
  end
endmodule
module module_1 (
    output wor id_0,
    output tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4,
    input tri1 id_5,
    output supply1 id_6
);
  genvar id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_1,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_1,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_4,
      id_6,
      id_3,
      id_2
  );
  assign modCall_1.type_38 = 0;
endmodule
