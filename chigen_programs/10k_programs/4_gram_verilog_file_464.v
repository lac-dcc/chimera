// Seed: 1108033647
module module_0;
  tri0 id_1, id_2;
  assign id_2 = 1;
  module_2();
endmodule
module module_1 (
    output wor  id_0,
    input  tri  id_1,
    input  tri0 id_2,
    input  tri  id_3,
    output wand id_4
);
  id_6(
      .id_0(~id_0),
      .id_1((1'b0)),
      .id_2(id_3),
      .id_3(1 && id_4),
      .id_4(id_3 - id_2),
      .id_5(id_4 - id_0)
  ); module_0();
endmodule
module module_2 #(
    parameter id_1 = 32'd12,
    parameter id_2 = 32'd79
);
  defparam id_1.id_2 = 1;
endmodule
