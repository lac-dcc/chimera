// Seed: 258028160
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output supply0 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    output supply1 id_6,
    input wire module_0
);
  assign id_6 = 1;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    output wand id_2,
    output wor id_3,
    input wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply1 id_8,
    input tri0 id_9,
    output wor id_10,
    output tri0 id_11
);
  wire id_13;
  always_latch @(posedge 1 or negedge 1) id_2 = {1, id_5, 1'b0, 1, 1};
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_9,
      id_9,
      id_10,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
