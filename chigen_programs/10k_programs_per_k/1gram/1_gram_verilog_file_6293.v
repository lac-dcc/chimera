// Seed: 2083787625
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri1 id_6,
    output tri id_7,
    output tri0 id_8
);
  struct packed {
    logic id_10;
    logic id_11;
    logic id_12;
  } id_13;
  ;
  assign id_8 = 1;
  logic id_14;
  wire  id_15;
  ;
  always @(*) id_13 = -1;
  assign id_15 = id_6.id_0;
endmodule
module module_1 (
    input  uwire id_0,
    inout  tri1  id_1,
    output tri   id_2,
    input  wire  id_3,
    input  tri   id_4
);
  for (id_6 = -1'd0; id_4; id_6 = id_3) assign id_2 = id_3;
  xor primCall (id_2, id_3, id_1, id_6, id_4, id_0);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
