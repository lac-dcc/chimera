// Seed: 115398872
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    input wire id_7,
    output tri id_8,
    input wor id_9,
    input tri1 id_10,
    output tri id_11
);
  logic id_13;
  assign id_1 = 1;
  wire id_14;
  assign id_11 = 1;
  wire id_15;
endmodule
module module_1 (
    output tri1 id_0,
    input  tri  id_1,
    input  tri0 id_2,
    input  wand id_3,
    input  wire id_4,
    input  wor  id_5,
    input  wire id_6
);
  assign id_0 = 1 & 1'd0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_6,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_5,
      id_3,
      id_0
  );
  assign modCall_1.id_10 = 0;
  assign id_0 = id_3;
endmodule
