// Seed: 3750003577
module module_0 (
    output supply1 id_0
    , id_10,
    output tri0 id_1,
    input supply0 id_2,
    output uwire id_3,
    output tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output supply0 id_7,
    input wire id_8
);
  wire id_11;
endmodule
module module_1 (
    input  wire id_0,
    output wor  id_1,
    output wand id_2,
    input  tri0 id_3,
    input  wand id_4
);
  assign id_1 = 1;
  wire id_6;
  xnor (id_2, id_3, id_6, id_4, id_0);
  module_0(
      id_2, id_2, id_0, id_1, id_2, id_3, id_1, id_2, id_3
  );
endmodule
module module_2 (
    input supply0 id_0,
    input wor id_1,
    output logic id_2,
    input wire id_3,
    input wire id_4,
    output tri1 id_5,
    input wire id_6,
    input supply0 id_7,
    output supply0 id_8,
    input wire id_9,
    input supply1 id_10
);
  id_12(
      .id_0(id_5),
      .id_1(1),
      .id_2(id_4),
      .id_3((id_2)),
      .id_4(!1),
      .id_5(id_0),
      .id_6(1),
      .id_7(id_1)
  ); module_0(
      id_5, id_5, id_9, id_5, id_5, id_7, id_5, id_8, id_1
  );
  always_comb @(posedge 1) id_2 <= 1;
endmodule
