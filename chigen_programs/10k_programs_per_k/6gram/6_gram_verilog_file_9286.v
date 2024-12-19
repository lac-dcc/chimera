// Seed: 3211443857
module module_0 (
    input supply1 id_0,
    output supply1 id_1
    , id_16,
    input supply0 id_2,
    input supply0 id_3,
    output wor id_4,
    input wire id_5,
    output supply1 id_6,
    input wire id_7,
    input uwire id_8,
    input uwire id_9,
    input tri id_10,
    input tri id_11,
    output tri0 id_12,
    output tri1 id_13,
    output tri0 id_14
);
  wire id_17;
  assign id_16 = id_8 ? 1 : id_2;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input wire id_2,
    input tri0 id_3,
    input logic id_4,
    input supply1 id_5,
    input wor id_6,
    output wire id_7,
    input wand id_8,
    output supply1 id_9
);
  wor id_11;
  always @(id_3 or id_11) force id_7 = id_4;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_2,
      id_7,
      id_2,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11,
      id_8,
      id_9,
      id_9,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
