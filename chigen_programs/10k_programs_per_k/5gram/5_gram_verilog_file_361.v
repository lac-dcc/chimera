// Seed: 2655083774
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4
);
  id_6(
      .id_0(id_1),
      .id_1((1)),
      .id_2(1),
      .id_3(1),
      .id_4(id_3),
      .id_5(id_0),
      .id_6(id_1),
      .id_7((1)),
      .id_8(1),
      .id_9(1)
  );
  assign id_6 = ~id_3;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    input tri1 id_5
);
  final $display(id_3, 1'b0 == 1, 1, 1, id_1);
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
  wire id_7;
endmodule
