// Seed: 502213131
module module_0 (
    input  wand id_0,
    input  wire id_1,
    output tri0 id_2,
    input  tri0 id_3
);
  assign id_2 = 1;
  id_5 :
  assert property (@(posedge id_1 == id_0) id_5)
  else $display;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    output wand  id_3,
    output tri0  id_4,
    output wand  id_5,
    input  tri1  id_6,
    output wire  id_7,
    input  wor   id_8
);
  assign id_7 = id_1;
  wor id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_8
  );
  always_comb @(posedge 1 or posedge 1'h0) $display(1);
  assign id_10 = id_0 ? 1 ^ 1'b0 ^ id_8 : (id_0 == id_8);
  id_11(
      .id_0(), .id_1(id_4), .id_2(id_0 * id_7), .id_3(id_2), .sum(id_2), .id_4(1)
  );
endmodule
