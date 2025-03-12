// Seed: 3500292848
module module_0 (
    output tri1 id_0,
    output wire id_1
);
endmodule
module module_1 #(
    parameter id_11 = 32'd90,
    parameter id_13 = 32'd9
) (
    inout uwire id_0,
    input wor id_1,
    output wor id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input uwire id_7,
    input uwire id_8,
    input tri id_9,
    output supply1 id_10,
    input tri _id_11,
    output tri1 id_12,
    input tri _id_13,
    output wire id_14,
    input tri1 id_15
);
  wire [(  id_13  ) : id_11] id_17;
  xor primCall (id_12, id_6, id_17, id_3, id_9, id_0, id_1, id_8, id_5, id_4, id_7, id_15);
  module_0 modCall_1 (
      id_0,
      id_12
  );
  assign modCall_1.id_0 = 0;
endmodule
