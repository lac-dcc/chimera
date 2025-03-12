// Seed: 3514046345
module module_0 (
    output wand id_0
);
endmodule
module module_1 (
    output tri1 id_0,
    output uwire id_1,
    input tri1 id_2,
    output tri0 id_3,
    output uwire id_4,
    output tri id_5,
    inout supply1 id_6,
    input supply1 id_7,
    input wire id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11
);
  module_0 modCall_1 (id_5);
  assign modCall_1.id_0 = 0;
endmodule
program module_2 #(
    parameter id_10 = 32'd38
) (
    input supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    output tri0 id_3,
    output wand id_4,
    input tri0 id_5,
    output wand id_6,
    input supply1 id_7,
    output wand id_8,
    output logic id_9,
    input wire _id_10,
    input tri id_11
);
  logic [7:0][id_10] id_13 = id_5;
  module_0 modCall_1 (id_8);
  assign modCall_1.id_0 = 0;
  initial id_9 <= id_13;
  wire  id_14;
  logic id_15;
  logic id_16;
  assign id_9 = -1;
endprogram
