// Seed: 2357406968
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input wor id_2,
    output wire id_3,
    output wor id_4,
    output supply1 id_5,
    output wand id_6,
    input wire id_7,
    output supply1 id_8,
    input tri id_9,
    output tri0 id_10,
    input tri id_11,
    input wand id_12
    , id_16,
    input tri id_13,
    output tri0 id_14
);
  logic id_17;
endmodule
module module_1 (
    inout supply1 id_0,
    output wand id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    output supply1 id_5,
    output wor id_6,
    input wire id_7,
    input wire id_8
);
  wire [1 : ""] id_10;
  logic [7:0][1 : -1] id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_0,
      id_6,
      id_6,
      id_1,
      id_5,
      id_7,
      id_0,
      id_7,
      id_1,
      id_7,
      id_8,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
  assign id_11[1] = -1;
  assign id_1 = 1;
  assign id_10 = {1{id_11}};
  nor primCall (id_1, id_4, id_2, id_10, id_8, id_11, id_0);
  assign id_0 = id_2;
endmodule
