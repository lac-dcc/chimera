// Seed: 3890913734
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6,
    output tri id_7,
    input tri id_8,
    input uwire id_9,
    input tri0 id_10,
    input wire id_11,
    output tri1 id_12
);
  wire id_14;
  assign id_12 = 1;
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    input  logic id_4
);
  reg id_6 = 1;
  always @(posedge 1) repeat (1) id_6 <= id_4;
  xnor (id_0, id_6, id_4);
  module_0(
      id_2, id_0, id_0, id_1, id_2, id_3, id_3, id_0, id_2, id_1, id_3, id_1, id_0
  );
endmodule
