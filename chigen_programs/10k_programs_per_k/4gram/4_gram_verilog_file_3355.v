// Seed: 3965333040
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    input tri id_7,
    output supply0 id_8,
    output supply0 id_9,
    output wor id_10,
    output wire id_11,
    input wand id_12,
    output tri id_13,
    output uwire id_14,
    output uwire id_15,
    input wor id_16,
    output wor id_17,
    output wand id_18
);
  assign #id_20 id_13 = id_12;
endmodule
module module_1 #(
    parameter id_14 = 32'd73,
    parameter id_4  = 32'd21
) (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input tri0 _id_4,
    input tri id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri0 id_8
);
  wire id_10;
  or primCall (id_1, id_5, id_0, id_7, id_2, id_10, id_6);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_8,
      id_3,
      id_2,
      id_6,
      id_6,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_7,
      id_3,
      id_1
  );
  assign modCall_1.id_18 = 0;
  logic id_11, id_12, id_13, _id_14, id_15, id_16;
  wire [(  id_4  ) : 1  &  id_14] id_17;
  assign id_3 = -1;
endmodule
