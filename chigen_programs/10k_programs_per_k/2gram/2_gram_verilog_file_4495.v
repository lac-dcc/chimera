// Seed: 3942073226
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input wire id_2,
    input tri0 id_3,
    input tri1 id_4
);
  wire id_6;
  id_7(
      .id_0(id_6), .id_1(id_2), .id_2(1), .id_3(id_3), .id_4(1)
  ); id_8(
      .id_0(id_6),
      .id_1(id_0),
      .id_2(id_7),
      .id_3(1),
      .id_4(id_3),
      .id_5(!1),
      .id_6(id_2),
      .id_7(id_3)
  );
  logic [7:0] id_9;
  wire id_10;
  assign id_1 = id_0 & 1 & id_9["" : 1'b0];
  assign module_1.type_7 = 0;
endmodule
macromodule module_1 #(
    parameter id_3 = 32'd79,
    parameter id_4 = 32'd50
) (
    input  uwire id_0,
    output wor   id_1
);
  defparam id_3.id_4 = 1;
  tri0 id_5 = id_0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_5,
      id_0
  );
  wire id_6;
endmodule
