// Seed: 2209832649
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wire id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output wand id_7,
    input wire id_8,
    output tri0 id_9,
    output uwire id_10,
    input tri id_11,
    input supply1 id_12,
    input supply1 id_13,
    input wand id_14,
    output uwire id_15,
    output uwire id_16,
    input wire id_17,
    input supply0 id_18,
    input uwire id_19
    , id_22,
    output wire id_20
);
  always force id_2 = id_5;
  assign module_1.id_1 = 0;
  wire id_23;
  assign id_2 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri1 id_4
);
  assign id_2 = 1 ? id_1 : -1'd0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_1,
      id_0,
      id_4,
      id_3,
      id_4,
      id_2,
      id_1,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_0,
      id_0,
      id_4
  );
endmodule
