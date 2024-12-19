// Seed: 3196882357
module module_0 (
    output supply1 id_0,
    input wand module_0,
    output tri id_2,
    input wand id_3,
    input wire id_4,
    input wand id_5
);
  assign id_2 = 1 & 1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    input uwire id_7,
    output wand id_8,
    input uwire id_9,
    output tri id_10,
    output tri1 id_11
);
  id_13(
      .id_0({1'd0{id_11}}),
      .id_1(id_8),
      .id_2(1),
      .id_3(id_4 * 1 + 1),
      .find(1),
      .id_4(id_3),
      .id_5(1),
      .id_6(1'b0)
  );
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_4,
      id_9,
      id_4
  );
  assign modCall_1.type_1 = 0;
  always @(negedge id_5) $display(id_13);
endmodule
