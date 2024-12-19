// Seed: 1429028803
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input uwire id_7,
    output supply1 id_8,
    input tri0 id_9,
    output supply0 id_10,
    output wire id_11,
    output tri1 id_12
);
  wand id_14 = 1 < id_7;
  assign id_12 = id_1;
  uwire id_15 = 1 - 1;
  assign id_12 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd95,
    parameter id_7 = 32'd43
) (
    input  tri1 id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output tri1 id_3,
    output tri  id_4
);
  defparam id_6.id_7 = 1 != id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
