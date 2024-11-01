// Seed: 2380478754
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    output wor   id_2,
    output tri1  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    output wor   id_6,
    output tri   id_7,
    output wand  id_8,
    input  tri0  id_9
);
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2
);
  always
    if (id_2 - id_1)
      assert (1'b0) $display(id_2);
      else begin
        assign id_0 = 1;
      end
  module_0(
      id_2, id_0, id_0, id_0, id_2, id_1, id_0, id_0, id_0, id_2
  ); id_4(
      .id_0(1),
      .id_1(id_2),
      .id_2((1'b0)),
      .id_3(id_2),
      .id_4(id_1),
      .id_5(id_0 == id_2),
      .id_6(1),
      .sum(id_1),
      .id_7(1 - 1 & 1),
      .id_8(1),
      .id_9(1),
      .id_10(1'd0),
      .id_11(1)
  );
endmodule
