// Seed: 2946299543
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output tri id_2,
    output tri0 id_3
    , id_17,
    input wand id_4,
    output wor id_5,
    output tri0 id_6,
    input supply1 id_7,
    input wand id_8,
    input wire id_9,
    output supply0 id_10,
    input tri0 id_11,
    input wire id_12#(
        .id_18(1),
        .id_19(1),
        .id_20({1, ~-1} & 1)
    ),
    input supply1 id_13,
    input tri id_14,
    input wor id_15
);
  assign id_17 = 1;
  assign id_5  = {id_17 & id_20{id_13}};
  logic id_21 = 1 & id_7;
  assign module_1.id_2 = 0;
  logic id_22 = -1;
  logic id_23;
  logic [-1 : -1] id_24;
endmodule
module module_1 (
    input wor id_0,
    output wand id_1,
    input uwire id_2,
    input wand id_3,
    output tri0 id_4,
    input wire id_5,
    input uwire id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply0 id_9
);
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_1,
      id_1,
      id_5,
      id_1,
      id_7,
      id_2,
      id_2,
      id_9,
      id_1,
      id_3,
      id_3,
      id_3,
      id_9,
      id_3
  );
  localparam id_11 = 1;
  assign id_1 = 1 + -1;
endmodule
