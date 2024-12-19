// Seed: 1919810611
module module_0 #(
    parameter id_17 = 32'd95,
    parameter id_18 = 32'd29
) (
    output tri id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wand id_4,
    input supply1 id_5,
    input wand id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9,
    input tri1 id_10,
    output tri0 id_11,
    output supply1 id_12,
    input wand id_13,
    output wand id_14,
    input tri1 id_15
);
  defparam id_17.id_18 = 1;
  tri id_19 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4
);
  id_6(
      .id_0(id_2), .id_1(id_1), .id_2(id_0)
  );
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_3,
      id_1,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_4,
      id_1,
      id_1,
      id_3,
      id_1,
      id_4
  );
endmodule
