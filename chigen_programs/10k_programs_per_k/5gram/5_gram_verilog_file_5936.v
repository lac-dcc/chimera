// Seed: 2619960654
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    output tri0 id_6,
    input wire id_7,
    output wire id_8,
    input wire id_9,
    output tri0 id_10,
    input wor id_11,
    input tri0 id_12,
    output supply1 id_13
    , id_18,
    output wor id_14,
    input supply1 id_15
    , id_19,
    output wor id_16
);
  assign id_13 = id_1 + -1'd0;
  assign module_1.id_1 = 0;
  logic id_20 = id_18;
  assign id_8 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    output supply1 id_2
);
  assign id_2 = -1'd0 ? id_0 == id_0 : -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1
  );
  assign id_1 = -1;
endmodule
