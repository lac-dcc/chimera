// Seed: 582828826
module module_0 (
    input  tri   id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output tri   id_4,
    output wire  id_5
);
  wire id_7;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  logic id_3,
    input  tri0  id_4,
    input  wand  id_5
);
  always @(id_3)
  fork : id_7
    id_7 = $display;
    id_7 <= 1 * 1;
  join : id_8
  module_0(
      id_2, id_0, id_5, id_1, id_0, id_0
  );
endmodule
module module_2 (
    input tri0 id_0,
    input wor  id_1
);
  assign id_3 = id_0;
  module_0(
      id_3, id_3, id_1, id_0, id_3, id_3
  );
  always @(id_0 or negedge id_1) $display(1, id_1, 1'b0);
endmodule
