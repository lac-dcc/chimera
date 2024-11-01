// Seed: 2242425642
module module_0 (
    input wor id_0,
    input tri id_1,
    output logic id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    output supply1 id_7
);
  wire id_9;
  final id_2 <= id_6 == id_0;
endmodule
module module_1 (
    inout  wor   id_0,
    input  tri1  id_1,
    input  tri   id_2,
    input  tri   id_3,
    input  logic id_4,
    output logic id_5,
    input  logic id_6,
    output wand  id_7
);
  assign id_5 = id_4;
  xor (id_5, id_2, id_3, id_0, id_4, id_1);
  module_0(
      id_2, id_0, id_5, id_0, id_3, id_1, id_1, id_0
  );
  always begin
    @(*) id_0 = 1;
    id_5 <= (id_6);
  end
endmodule
