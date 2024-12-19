// Seed: 1658510711
module module_0 (
    output wand id_0,
    output tri  id_1,
    input  tri1 id_2,
    output wor  id_3,
    output tri  id_4
);
  id_6(
      .id_0(1), .id_1(1), .id_2(id_2)
  );
  wire id_7;
  id_8(
      .id_0(id_7), .id_1(1'b0)
  );
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    inout tri id_2,
    input uwire id_3,
    input wire id_4,
    input supply0 id_5,
    output uwire id_6
);
  assign id_2 = 1;
  wire id_8;
  wire id_9;
  always @(negedge 1) id_2 = 1;
  id_10(
      .id_0(id_9), .id_1(id_5), .id_2(id_4 - 1), .id_3(id_6), .id_4(id_8), .id_5(1)
  );
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wire id_11;
endmodule
