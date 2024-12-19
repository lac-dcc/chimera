// Seed: 1228000283
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wand id_6
);
  wire id_8;
endmodule
module module_1 #(
    parameter id_8 = 32'd42,
    parameter id_9 = 32'd79
) (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wand id_3,
    input supply0 id_4
);
  wire id_6, id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_2,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_5 = 0;
  defparam id_8.id_9 = 1 == id_0;
endmodule
