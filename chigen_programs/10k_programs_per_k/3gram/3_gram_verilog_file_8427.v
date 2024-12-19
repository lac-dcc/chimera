// Seed: 1674697829
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output wand id_2,
    input wand id_3,
    input tri1 id_4,
    output tri1 id_5,
    output wor id_6,
    output wand id_7,
    output wand id_8,
    output supply0 id_9
);
  assign id_7 = {id_0, ~1, 1'd0};
endmodule
module module_1 #(
    parameter id_7 = 32'd65,
    parameter id_8 = 32'd59
) (
    output tri id_0,
    output supply1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    input uwire id_4,
    input wand id_5
);
  defparam id_7.id_8 = id_7;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_5,
      id_4,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_2 = 0;
  assign id_0 = 1;
endmodule
