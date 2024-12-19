// Seed: 1242869183
module module_0 (
    output tri id_0,
    input wand id_1,
    output supply1 id_2,
    output tri1 id_3,
    output wor id_4,
    output tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    input wire id_9
);
  wire id_11;
  assign id_0 = id_7;
endmodule
module module_1 #(
    parameter id_8 = 32'd39,
    parameter id_9 = 32'd58
) (
    input wire id_0,
    output uwire id_1,
    output tri id_2,
    input uwire id_3,
    output wor id_4,
    input wand id_5,
    input supply0 id_6
);
  defparam id_8.id_9 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_1,
      id_1,
      id_4,
      id_1,
      id_6,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.type_12 = 0;
  wire id_10;
endmodule
