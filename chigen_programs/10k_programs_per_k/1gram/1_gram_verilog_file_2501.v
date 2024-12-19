// Seed: 3399381981
macromodule module_0 (
    output wire id_0,
    input supply0 id_1,
    input tri1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output uwire id_5,
    input wand id_6,
    input wor id_7,
    input wand id_8,
    input uwire id_9,
    input tri0 id_10,
    output wor id_11,
    input tri0 id_12,
    input uwire id_13,
    input tri0 id_14
);
endmodule
module module_1 #(
    parameter id_10 = 32'd77,
    parameter id_11 = 32'd15,
    parameter id_12 = 32'd93,
    parameter id_13 = 32'd35
) (
    input supply1 id_0
    , id_9,
    output supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    output wand id_4,
    output wor id_5,
    input tri1 id_6,
    input tri id_7
);
  or primCall (
      id_1, id_16, id_9, id_3, id_2, id_12, id_10, id_6, id_11, id_0, id_15, id_13, id_14, id_7
  );
  defparam id_10 = id_9, id_11 = 1, id_12 = 1, id_13 = 1'h0;
  wire id_14, id_15;
  id_16(
      id_10
  );
  module_0 modCall_1 (
      id_5,
      id_2,
      id_0,
      id_4,
      id_0,
      id_1,
      id_7,
      id_3,
      id_0,
      id_2,
      id_2,
      id_5,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
