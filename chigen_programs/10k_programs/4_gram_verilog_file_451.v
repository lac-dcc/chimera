// Seed: 1542379763
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  tri0  id_4,
    output wire  id_5,
    input  wor   id_6,
    input  tri0  module_0,
    output wand  id_8,
    output uwire id_9
);
  id_11(
      .id_0(id_0), .id_1(1'h0), .id_2(1), .id_3(id_6)
  );
endmodule
module module_1 (
    output tri id_0,
    input  tri id_1
);
  always_latch @(*) id_0 = id_1;
  uwire id_3 = id_1;
  module_0(
      id_3, id_1, id_1, id_1, id_3, id_0, id_3, id_3, id_3, id_3
  );
  wor id_4 = id_1.id_1;
  assign id_3 = 1'h0;
  assign id_4 = (1);
  wire id_5 = 1;
endmodule
