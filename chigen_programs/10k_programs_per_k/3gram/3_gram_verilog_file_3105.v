// Seed: 1524689008
module module_0 (
    output wand id_0
    , id_16,
    input wand id_1,
    input uwire id_2,
    input wire id_3,
    output tri id_4,
    input uwire id_5,
    output uwire id_6,
    output wire id_7,
    input wand id_8,
    input tri0 id_9,
    input supply1 id_10,
    input wor id_11,
    output tri0 id_12,
    output wand id_13,
    output uwire id_14
);
  wire id_17;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    inout wor id_2,
    output supply1 id_3,
    input wire id_4,
    output uwire id_5,
    output wire id_6,
    output tri0 id_7,
    output tri id_8,
    input supply0 id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wor id_12
);
  wire id_14;
  or primCall (id_8, id_4, id_2, id_1, id_15, id_12, id_10, id_9, id_14);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_7,
      id_5,
      id_1,
      id_12,
      id_9,
      id_10,
      id_7,
      id_8,
      id_8
  );
  assign modCall_1.id_3 = 0;
endmodule
