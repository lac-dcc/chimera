// Seed: 3881784119
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input wand id_2,
    output wor id_3,
    output uwire id_4,
    input wand id_5,
    input tri id_6,
    output wand id_7,
    input wor id_8,
    input supply0 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    input wor id_14,
    input uwire id_15,
    output wor id_16,
    input tri1 id_17,
    input tri1 id_18,
    input tri1 id_19,
    input tri id_20,
    input wire id_21,
    input wor id_22,
    input tri id_23
);
  supply0 id_25 = -1'b0, id_26 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd53
) (
    output wand id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    inout wire id_4,
    output wire id_5,
    input supply1 _id_6,
    input wor id_7[-1 : id_6]
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_7,
      id_0,
      id_5,
      id_3,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0,
      id_2,
      id_7,
      id_7,
      id_1,
      id_7,
      id_0,
      id_3,
      id_2,
      id_7,
      id_1,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_6 = 0;
  assign id_4 = id_4;
endmodule
