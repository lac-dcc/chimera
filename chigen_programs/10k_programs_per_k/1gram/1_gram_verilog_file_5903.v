// Seed: 4149269253
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3
);
  wire id_5;
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1,
    output tri0  id_2,
    output tri0  id_3,
    output wire  id_4,
    input  logic id_5,
    input  logic id_6,
    input  wire  id_7,
    input  tri1  id_8,
    input  tri   id_9
);
  logic id_11, id_12;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_8,
      id_8
  );
  assign modCall_1.type_7 = 0;
  id_13 :
  assert property (@(id_5) id_11) @(id_6) {1} <= id_11;
endmodule
