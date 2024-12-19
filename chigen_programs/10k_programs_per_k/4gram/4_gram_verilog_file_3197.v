// Seed: 431489156
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input tri id_6,
    output wire id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12
);
  id_14(
      .id_0(1), .id_1(id_6), .id_2('b0), .id_3(1), .id_4(1'b0), .id_5(1), .id_6(1), .id_7(1)
  );
endmodule
module module_1 (
    output wor   id_0,
    output uwire id_1,
    output tri   id_2,
    output wor   id_3,
    inout  wor   id_4
);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  tri1 id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17 = id_16;
  wire id_18;
  tri0 id_19 = (1) - 1;
  assign id_6 = 1;
  id_20 :
  assert property (@(posedge id_12) 1)
  else $display(~id_8);
  wire id_21;
  assign id_7 = id_20 ? 1 : 1;
endmodule
