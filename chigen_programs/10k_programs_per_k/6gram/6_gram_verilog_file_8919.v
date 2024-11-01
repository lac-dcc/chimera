// Seed: 1889859606
module module_0 #(
    parameter id_8 = 32'd64,
    parameter id_9 = 32'd28
) (
    input uwire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri id_3,
    input supply1 id_4,
    output tri id_5
);
  wire id_7;
  defparam id_8.id_9 = id_9;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output wand id_2,
    output wire id_3,
    input supply0 id_4,
    input uwire id_5,
    inout wire id_6,
    input uwire id_7,
    input tri id_8,
    input supply1 id_9,
    output tri0 id_10,
    input tri1 id_11,
    input wand id_12,
    input uwire id_13,
    input wand id_14,
    input uwire id_15,
    output tri id_16,
    input wor id_17,
    output uwire id_18
);
  id_20(
      1, 1, id_7
  );
  nand (
      id_6,
      id_20,
      id_17,
      id_15,
      id_14,
      id_9,
      id_7,
      id_5,
      id_11,
      id_4,
      id_1,
      id_12,
      id_0,
      id_13,
      id_8
  );
  module_0(
      id_15, id_1, id_6, id_4, id_6, id_6
  );
endmodule
