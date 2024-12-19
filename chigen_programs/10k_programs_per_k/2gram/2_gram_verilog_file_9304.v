// Seed: 944346017
program module_0 (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    output wor id_3,
    input tri1 id_4
);
endprogram
module module_1 (
    input  logic id_0,
    output wand  id_1,
    input  tri0  id_2
);
  wire id_4;
  reg id_5, id_6;
  wire id_7 = id_4;
  assign id_6 = (1);
  always_latch id_6 <= id_0;
  id_8(
      .id_0(1), .id_1(id_0), .id_2(1), .id_3(1'b0)
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.type_7 = 0;
endmodule
