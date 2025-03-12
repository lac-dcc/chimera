// Seed: 2424764785
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input tri0 id_2,
    output supply1 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input wand id_6,
    input supply1 id_7,
    output supply1 id_8,
    input tri1 id_9,
    input tri1 id_10,
    input supply0 id_11,
    output tri1 id_12,
    input tri1 id_13,
    output uwire id_14,
    output uwire id_15,
    input supply1 id_16,
    input tri id_17,
    input tri0 id_18,
    input wand id_19,
    output tri id_20,
    input supply0 flow,
    output supply1 id_22,
    input tri0 id_23,
    input tri id_24,
    output supply0 id_25,
    input uwire id_26
);
  assign id_25 = id_19;
  assign id_12 = id_6 & 1 & -1;
  assign module_0 = -1;
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    input tri id_2,
    output tri id_3,
    input wire id_4,
    input wor id_5,
    output supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    input supply0 id_9
);
  uwire id_11;
  logic id_12;
  assign id_11 = 1;
  assign id_1  = 1 ? id_8 : 1 < id_12;
  wire \id_13 ;
  assign \id_13 = !id_2;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_8,
      id_3,
      id_2,
      id_0,
      id_7,
      id_9,
      id_1,
      id_8,
      id_5,
      id_5,
      id_6,
      id_8,
      id_6,
      id_1,
      id_7,
      id_8,
      id_7,
      id_2,
      id_6,
      id_2,
      id_1,
      id_9,
      id_9,
      id_3,
      id_7
  );
  assign modCall_1.id_21 = 0;
  assign id_12 = \id_13 ? id_8 : 1;
endmodule
