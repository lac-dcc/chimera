// Seed: 1263699855
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input wor id_4
);
  wire id_6;
  struct packed {
    logic id_7;
    logic id_8;
  } id_9;
  assign id_9.id_7 = -1;
  wire id_10;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output wire  id_5,
    input  tri0  id_6,
    input  tri   id_7,
    inout  tri0  id_8,
    input  uwire id_9,
    output wire  id_10
);
  assign id_5 = 1;
  wire id_12;
  wire [-1 : 1 'b0 &  -1  &  1 'd0] id_13;
  parameter id_14 = -1'h0;
  nor primCall (id_5, id_9, id_8, id_14, id_3, id_6, id_2, id_1, id_12, id_7, id_4, id_13);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_0,
      id_9
  );
endmodule
