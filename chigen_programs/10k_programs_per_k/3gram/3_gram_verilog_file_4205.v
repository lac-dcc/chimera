// Seed: 1016961942
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 id_3
);
  wire id_5;
endmodule
module module_1 (
    output tri0  id_0,
    input  logic id_1,
    input  wire  id_2,
    inout  logic id_3
);
  always_ff @(id_3, posedge id_3 - 1) id_3 <= id_1;
  logic id_5;
  assign id_5 = id_3;
  wire  id_6;
  tri   id_7;
  logic id_8;
  module_0(
      id_2, id_2, id_2, id_2
  );
  always #1 if (id_7) $display(id_1);
  assign id_8 = id_1;
endmodule
