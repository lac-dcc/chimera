// Seed: 3032722097
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output wire id_2,
    input wor id_3,
    output supply1 id_4,
    output wor id_5,
    output tri1 id_6,
    output tri1 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input wire id_10,
    output wand id_11,
    output wire id_12,
    input tri0 id_13,
    input wand id_14
);
  wire [1 : ""] id_16;
  always @(negedge id_1);
  logic id_17;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input supply1 id_4,
    output supply0 id_5
);
  logic id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5,
      id_2,
      id_4,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
