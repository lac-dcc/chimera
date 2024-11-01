// Seed: 3420401057
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    output tri id_5,
    output wand id_6,
    input supply0 id_7
    , id_11,
    output uwire id_8,
    input uwire id_9
);
  id_12(
      .id_0(1),
      .id_1(id_5),
      .id_2(1'b0),
      .id_3(1),
      .id_4(id_1),
      .id_5(id_11[1] & 1),
      .id_6(1),
      .id_7(1)
  ); id_13(
      .id_0(1), .id_1(1'h0 + id_3 - 1'd0), .id_2(1), .id_3(id_3), .id_4(id_1), .id_5(id_5)
  );
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    output wor id_2,
    output wor id_3
);
  assign id_3 = id_0;
  module_0(
      id_2, id_0, id_0, id_0, id_0, id_3, id_2, id_0, id_2, id_0
  );
endmodule
