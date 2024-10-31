// Seed: 3359531848
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = !id_1 + id_5 - 1 ? id_1 : id_4 - 1'b0;
  wire id_6;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    output tri   id_2,
    output wire  id_3,
    output wand  id_4,
    input  wire  id_5,
    input  wor   id_6,
    input  wor   id_7,
    input  tri   id_8,
    input  uwire id_9
);
  wire id_11;
  tri0 id_12;
  module_0(
      id_11, id_11, id_11, id_12, id_12
  ); id_13(
      .id_0(id_8),
      .id_1(id_9),
      .id_2(id_11),
      .id_3(id_12 * id_0 & id_4 & (1)),
      .id_4(1'b0),
      .id_5(1),
      .id_6(1'b0)
  );
  nor (id_2, id_9, id_12, id_5, id_7, id_11, id_8);
endmodule
