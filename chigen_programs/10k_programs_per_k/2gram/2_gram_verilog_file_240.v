// Seed: 3758409373
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input tri0 id_2,
    output wor id_3,
    output wor id_4
    , id_21,
    input supply1 id_5,
    input tri1 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    input wire id_16,
    input uwire id_17,
    input wor id_18,
    input wor id_19
);
  assign id_21 = 1 ? 1 : id_14;
  wire id_22;
  wire id_23;
  tri1 id_24 = id_6;
  assign id_4 = id_6;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input uwire id_2,
    input uwire id_3,
    input tri id_4,
    input wor id_5,
    input wor id_6,
    output wor id_7,
    input supply0 id_8,
    input supply1 id_9,
    output wand id_10,
    input supply1 id_11,
    input supply0 id_12
);
  assign id_7 = id_3;
  supply1 id_14 = 1;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_6,
      id_7,
      id_10,
      id_9,
      id_6,
      id_1,
      id_4,
      id_2,
      id_12,
      id_3,
      id_4,
      id_3,
      id_11,
      id_10,
      id_6,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_15 = 0;
  always id_1 = 1;
  wire id_15;
endmodule
