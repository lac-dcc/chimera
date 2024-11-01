// Seed: 1301680341
module module_0 (
    output logic id_0,
    input  tri   id_1,
    input  tri   id_2,
    output wor   id_3,
    output tri0  id_4,
    output tri   id_5
);
  always @(id_1) begin
    id_0 <= 1;
  end
endmodule
module module_1 (
    output wand  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    input  wand  id_4,
    input  wand  id_5,
    output logic id_6,
    input  tri1  id_7,
    input  tri1  id_8,
    input  wire  id_9,
    input  tri0  id_10,
    output wire  id_11,
    input  logic id_12,
    output tri   id_13,
    output tri   id_14
);
  xor (id_0, id_5, id_1, id_9, id_7, id_12, id_8, id_3, id_10);
  module_0(
      id_6, id_2, id_4, id_13, id_13, id_0
  );
  uwire id_16 = id_2;
  always id_6 = #1 id_12;
endmodule
