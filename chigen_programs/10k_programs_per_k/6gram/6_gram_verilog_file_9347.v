// Seed: 1016753360
module module_0 (
    input wand id_0,
    output wand id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wand id_4,
    input wor id_5,
    input wor id_6,
    input supply1 id_7,
    input supply1 id_8,
    output tri1 id_9,
    input uwire id_10,
    input supply0 id_11,
    input wor id_12,
    output supply1 id_13
);
  id_15(
      .id_0(id_10 - 1), .id_1(id_1), .id_2(1)
  );
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input logic id_2,
    input wand id_3,
    input supply1 id_4,
    output supply0 id_5
);
  always force id_1 = id_2;
  logic [7:0] id_7;
  wire id_8;
  wire id_9;
  module_0(
      id_3, id_1, id_4, id_1, id_3, id_3, id_0, id_0, id_3, id_5, id_4, id_0, id_0, id_1
  );
  assign id_7[1] = 1;
endmodule
