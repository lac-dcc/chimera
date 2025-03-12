// Seed: 1437755088
module module_0 #(
    parameter id_20 = 32'd62
) (
    output tri1 id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    output tri id_4,
    output tri id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    input wand id_9,
    input supply0 id_10,
    output wand id_11,
    output wor id_12,
    input wire id_13,
    output wire id_14,
    output tri0 id_15,
    output supply0 id_16
);
  wire id_18;
  wire id_19;
  assign id_11 = 1;
  parameter id_20 = -1;
  always @(negedge 1);
  wire [1 : id_20] id_21;
endmodule
module module_1 (
    output tri1 id_0,
    input  tri0 id_1,
    input  tri  id_2,
    input  tri0 id_3
);
  logic id_5;
  buf primCall (id_0, id_2);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
