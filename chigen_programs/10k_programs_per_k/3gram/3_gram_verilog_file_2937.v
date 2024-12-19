// Seed: 1383581008
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    output wand id_5,
    input supply1 id_6,
    output tri id_7,
    input wor id_8,
    input tri0 id_9,
    input supply1 id_10
);
endmodule
module module_1 (
    input logic id_0,
    input wand id_1,
    input supply1 id_2,
    output wand id_3
);
  logic id_5, id_6;
  always @(posedge 1) id_5 <= "";
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_9 = 0;
  or primCall (id_3, id_1, id_0, id_2);
  assign id_5 = id_0;
endmodule
