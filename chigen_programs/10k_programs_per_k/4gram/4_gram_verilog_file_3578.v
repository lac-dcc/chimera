// Seed: 3113028635
module module_0 (
    output tri  id_0,
    output wand id_1
);
  assign id_1 = 1'b0 ? 1 : 1 / id_3;
  assign module_2.type_14 = 0;
  assign id_3 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2,
    input  tri1  id_3,
    input  tri1  id_4,
    input  wand  id_5
);
  assign id_2 = 1 ? id_4 : 1'b0;
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 #(
    parameter id_10 = 32'd92,
    parameter id_11 = 32'd51
) (
    output wand  id_0,
    output uwire id_1,
    output wand  id_2,
    output wor   id_3,
    input  tri   id_4,
    input  tri1  id_5,
    input  tri1  id_6,
    input  tri   id_7,
    output wire  id_8
);
  defparam id_10.id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  id_12(
      .id_0(id_2),
      .id_1(1),
      .id_2({id_0, 1'b0, 1, id_7, 1, 1, 1, id_1, 1, 1'b0, 1}),
      .id_3(1),
      .id_4(id_6),
      .id_5(!id_1),
      .id_6(id_8)
  );
endmodule
