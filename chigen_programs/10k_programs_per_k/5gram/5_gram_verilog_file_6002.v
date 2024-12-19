// Seed: 1168802188
module module_0 (
    output uwire id_0,
    output tri0  id_1,
    output wand  id_2,
    input  tri   id_3,
    input  tri0  id_4
);
  always @(posedge 1 or id_4) if (id_4) id_2 = 1;
  wire id_6;
endmodule
module module_1 (
    input  tri0  id_0,
    output uwire id_1
);
  id_3(
      .id_0(1), .id_1(1), .id_2(1), .id_3(), .id_4(id_1), .id_5(1), .id_6(id_0), .sum(1)
  );
  wire id_4;
  wire id_5, id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
