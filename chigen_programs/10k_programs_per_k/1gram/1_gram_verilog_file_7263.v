// Seed: 4046166332
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input tri1 id_3,
    output tri id_4,
    input wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    input supply0 id_8,
    output tri0 id_9,
    input tri id_10,
    input wand id_11,
    input tri0 id_12,
    output uwire id_13,
    input tri0 id_14,
    output wor id_15,
    output tri0 id_16,
    input uwire id_17,
    output wand id_18,
    output tri1 id_19,
    input uwire id_20,
    input supply1 id_21,
    input tri1 id_22
);
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wire id_4,
    input wand id_5,
    input wand id_6,
    output uwire id_7,
    input uwire id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11
);
  wire id_13, id_14;
  uwire id_15, id_16 = 1, id_17;
  reg id_18, id_19, id_20, id_21 = 1, id_22;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_1,
      id_2,
      id_9,
      id_2,
      id_0,
      id_11,
      id_2,
      id_9,
      id_4,
      id_8,
      id_10,
      id_0,
      id_8,
      id_0,
      id_7,
      id_10,
      id_7,
      id_9,
      id_4,
      id_5,
      id_10
  );
  assign modCall_1.id_22 = 0;
  assign id_21 = (1);
  always @(posedge 1 or posedge id_15) id_20 <= 1;
  wire id_23;
  wire id_24, id_25;
endmodule
