// Seed: 3736610141
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input wire id_5,
    output uwire id_6,
    input uwire id_7,
    output supply0 id_8,
    output wor id_9,
    input tri id_10,
    output supply1 id_11,
    input tri0 id_12,
    input uwire id_13,
    input wor id_14,
    input wor id_15,
    output supply1 id_16,
    input tri1 id_17,
    input wor id_18,
    output supply0 id_19,
    input supply0 id_20,
    input wand id_21
);
  wire id_23;
  assign id_6 = id_18;
endmodule
module module_1 #(
    parameter id_16 = 32'd66
) (
    input supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri id_4,
    input uwire id_5,
    input wand id_6,
    input tri id_7,
    output tri1 id_8,
    input tri0 id_9,
    input wand id_10,
    input supply0 id_11,
    output tri0 id_12,
    output supply0 id_13,
    input supply1 id_14,
    input tri0 id_15,
    output wand _id_16
);
  logic [id_16 : 1] id_18 = id_11;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_12,
      id_1,
      id_5,
      id_8,
      id_1,
      id_8,
      id_13,
      id_9,
      id_8,
      id_10,
      id_0,
      id_1,
      id_2,
      id_13,
      id_7,
      id_5,
      id_8,
      id_14,
      id_7
  );
  assign modCall_1.id_19 = 0;
  wire [(  1  ) : 1] id_19;
endmodule
