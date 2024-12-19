// Seed: 3311641486
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output uwire id_4
);
  wire id_6;
  wor  id_7;
  assign id_7 = 1 - 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd90,
    parameter id_9  = 32'd99
) (
    output tri  id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  wor  id_4,
    output tri0 id_5,
    output wand id_6,
    input  tri  id_7
);
  defparam id_9.id_10 = id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_5
  );
  assign modCall_1.type_11 = 0;
  assign id_6 = 1'b0;
endmodule
