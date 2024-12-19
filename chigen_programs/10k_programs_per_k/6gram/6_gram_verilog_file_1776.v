// Seed: 3775995821
module module_0 (
    input uwire id_0,
    input tri1  id_1,
    input tri0  id_2,
    input wand  id_3,
    input tri1  id_4,
    input wor   id_5
);
  logic [7:0] id_7;
  assign module_1.id_0 = 0;
  reg id_8;
  always @(*) id_8 <= id_8;
  wire id_9, id_10;
  integer id_11;
  assign #1 id_9 = 1;
  id_12(
      .id_0(1),
      .id_1((1)),
      .id_2(1),
      .id_3(1'h0),
      .id_4(1),
      .id_5(id_7),
      .id_6(id_2),
      .id_7(1'h0),
      .id_8(id_9),
      .id_9(id_0),
      .id_10(1),
      .id_11(id_5)
  ); id_13(
      .id_0(1), .id_1(id_11), .id_2(id_7[1])
  );
  wire id_14;
  wand id_15 = id_10;
  wire id_16;
  assign id_7[1-1] = id_0 == 1'b0 < 1;
endmodule
module module_1 (
    output uwire id_0,
    output tri1  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output tri1  id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3
  );
endmodule
