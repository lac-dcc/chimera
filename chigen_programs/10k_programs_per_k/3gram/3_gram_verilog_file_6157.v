// Seed: 3795008649
module module_0 (
    output wire id_0,
    input tri0 id_1,
    input tri id_2,
    input wand id_3,
    input wor id_4
    , id_14,
    input wor id_5,
    input supply0 id_6,
    output supply1 id_7,
    input wor id_8,
    output wire id_9,
    output wor id_10,
    output wand id_11,
    input wire id_12
);
  wire id_15;
  localparam id_16 = 1;
  wire [1 : 1] id_17;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output supply1 id_4
    , id_11,
    input wor id_5,
    output tri id_6,
    input wor id_7,
    input wor id_8,
    input supply1 id_9
);
  assign id_11 = id_1 + 1;
  xor primCall (id_6, id_9, id_0, id_7, id_5, id_2, id_11, id_8, id_3, id_1);
  module_0 modCall_1 (
      id_4,
      id_7,
      id_1,
      id_9,
      id_7,
      id_1,
      id_8,
      id_6,
      id_3,
      id_6,
      id_4,
      id_6,
      id_9
  );
endmodule
