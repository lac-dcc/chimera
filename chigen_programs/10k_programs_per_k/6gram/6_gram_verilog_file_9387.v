// Seed: 4154503173
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    output wire id_6
    , id_22,
    input wor id_7,
    output supply0 id_8,
    input tri0 id_9,
    output wire id_10,
    input wire id_11,
    input wire id_12,
    input wire id_13,
    input tri0 id_14,
    output wor id_15,
    input tri0 id_16,
    output supply1 id_17,
    output supply0 id_18,
    input supply0 id_19,
    input supply1 id_20
);
  wire id_23;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    output tri0 id_2,
    input wand id_3,
    input tri0 id_4,
    input supply1 id_5,
    output supply1 id_6,
    output uwire id_7
);
  wire id_9;
  assign id_7 = 1'b0 ? id_5 : 1 - id_3;
  wire id_10;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1,
      id_4,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1,
      id_5,
      id_1,
      id_0,
      id_5,
      id_0,
      id_4,
      id_2,
      id_5,
      id_2,
      id_7,
      id_5,
      id_3
  );
  assign modCall_1.id_19 = 0;
endmodule
