// Seed: 2838292836
macromodule module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    input wire id_4,
    output wand id_5,
    input wand id_6,
    output tri id_7,
    input uwire id_8,
    output wire id_9,
    input wand id_10
);
  assign id_1 = id_0;
  assign id_9 = id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd14,
    parameter id_6 = 32'd89
) (
    input  tri   id_0,
    output tri1  id_1,
    input  uwire id_2
);
  assign id_1 = id_0;
  assign id_1 = id_2;
  id_4(
      .id_0(1 - id_1), .id_1(1), .id_2(1), .id_3(1), .id_4(1'b0), .id_5(1)
  );
  assign id_1 = 1;
  assign id_1 = 1;
  defparam id_5.id_6 = 1;
  logic [7:0] id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  always id_7[1] = 1;
endmodule
