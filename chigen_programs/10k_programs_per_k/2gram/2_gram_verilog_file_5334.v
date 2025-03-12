// Seed: 4239120075
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input wor id_3,
    output wor id_4,
    output supply0 id_5,
    input wand id_6,
    input wor id_7,
    input wire id_8,
    input tri0 id_9,
    input wor id_10,
    input tri id_11,
    output tri id_12,
    input uwire id_13,
    input tri1 id_14,
    output wor id_15,
    input tri id_16,
    input tri1 id_17
    , id_20,
    input tri1 id_18
);
  assign id_15 = id_9;
  wire id_21;
  ;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output tri id_2,
    output tri0 id_3,
    output wor id_4,
    input wire id_5,
    input wand id_6,
    output tri0 id_7,
    output supply1 id_8,
    output tri0 id_9,
    input tri id_10,
    output wire id_11,
    output tri0 id_12,
    input tri1 id_13,
    output wire id_14,
    input wand id_15
);
  xnor primCall (id_8, id_13, id_1, id_15, id_10, id_6, id_5);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_5,
      id_9,
      id_3,
      id_5,
      id_5,
      id_5,
      id_15,
      id_15,
      id_6,
      id_9,
      id_10,
      id_1,
      id_11,
      id_6,
      id_6,
      id_13
  );
  assign modCall_1.id_16 = 0;
endmodule
