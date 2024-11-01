// Seed: 4255845087
module module_0 (
    input  wor   id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wire  id_4,
    input  uwire id_5,
    output tri0  id_6
);
  logic [7:0] id_8;
  assign id_6 = 1;
  assign id_8[1'h0] = 1;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1
);
  assign id_0 = id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_0, id_1, id_0
  );
  wire id_3;
endmodule
module module_2 (
    output supply0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    output supply0 id_4,
    output supply0 id_5,
    output wor id_6,
    output wire id_7,
    output tri1 id_8,
    output tri id_9,
    output supply1 id_10,
    input wire id_11,
    output uwire id_12,
    output wire id_13,
    input wand id_14
);
  module_0(
      id_3, id_11, id_11, id_11, id_9, id_2, id_7
  ); id_16(
      .id_0(id_4), .id_1(1), .id_2(id_3), .id_3(id_2), .id_4(id_12), .id_5(1'b0), .id_6(1'b0)
  );
  xnor (id_7, id_2, id_14, id_3, id_11);
  tri0 id_17 = (("")) ^ 1'd0;
  id_18(
      .id_0(1'h0 - id_13), .id_1(id_0)
  );
endmodule
