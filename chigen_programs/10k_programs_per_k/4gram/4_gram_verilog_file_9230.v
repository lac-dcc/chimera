// Seed: 974506204
module module_0 (
    output wand id_0,
    output wire id_1,
    input supply1 id_2
);
  assign id_0 = 1'h0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri1 id_4
);
  wire id_6;
  nor primCall (id_4, id_3, id_1, id_2);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3
  );
  id_8(
      .id_0(),
      .id_1(id_0),
      .id_2(1'd0),
      .id_3(),
      .id_4(""),
      .id_5(id_4),
      .id_6(1'd0),
      .id_7(id_4),
      .id_8(id_7),
      .id_9(id_0),
      .id_10(1 & 1),
      .id_11(1),
      .id_12(1'b0)
  );
endmodule
