// Seed: 2995749089
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    input  tri1 id_2,
    output wand id_3
);
  assign module_1.id_6 = 0;
  id_5(
      .id_0(id_3), .id_1(id_6 & ~id_3 & (id_0 || 1))
  );
  wire id_7;
  wire id_8;
endmodule
module module_1 #(
    parameter id_6 = 32'd29,
    parameter id_7 = 32'd43
) (
    output wand id_0,
    input supply1 id_1,
    input wor id_2,
    input wand id_3,
    output tri id_4
);
  defparam id_6.id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_0
  );
endmodule
