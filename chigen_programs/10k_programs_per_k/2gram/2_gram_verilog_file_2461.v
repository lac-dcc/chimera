// Seed: 3942338050
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input tri id_2,
    output wire id_3,
    input supply0 id_4,
    input wor id_5,
    output tri0 id_6,
    output tri1 id_7,
    input wor id_8
    , id_17,
    input supply1 id_9,
    output wor id_10,
    input tri id_11,
    input uwire id_12,
    output tri0 id_13,
    output wand id_14,
    input tri0 id_15
);
  logic id_18;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    input tri0 id_2
    , id_9,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wand id_6,
    output uwire id_7
);
  nand primCall (id_6, id_5, id_10, id_0, id_4, id_9, id_1);
  localparam id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_6,
      id_4,
      id_5,
      id_6,
      id_7,
      id_1,
      id_1,
      id_7,
      id_2,
      id_2,
      id_7,
      id_7,
      id_3
  );
endmodule
