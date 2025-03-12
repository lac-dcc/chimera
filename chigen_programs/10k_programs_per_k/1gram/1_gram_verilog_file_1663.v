// Seed: 3507702491
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply0 id_3,
    output wand id_4,
    input uwire id_5,
    input tri0 id_6,
    output supply1 id_7,
    input tri id_8,
    input supply0 id_9,
    input supply0 id_10,
    output wor id_11,
    input uwire id_12,
    input uwire void id_13,
    input wire id_14,
    input uwire id_15,
    input tri0 id_16,
    input tri0 id_17,
    output wor id_18,
    output wand id_19,
    input wor id_20,
    input supply0 id_21,
    output tri id_22,
    output wire id_23,
    input wand id_24
);
  wire id_26;
  ;
  logic id_27;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2
);
  initial $clog2(73);
  ;
  assign id_2 = id_1;
  bit id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_16 = 0;
  always id_4 <= -1 - -1;
  assign id_2 = 1;
  assign id_4 = -1 == -1;
  nand primCall (id_2, id_4, id_0, id_1);
endmodule
