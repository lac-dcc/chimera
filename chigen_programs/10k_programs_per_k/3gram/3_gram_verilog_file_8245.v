// Seed: 1567980023
module module_0 (
    input tri id_0,
    input supply0 id_1,
    output uwire id_2,
    output wor id_3,
    output wire id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input tri id_8,
    input uwire id_9,
    input wor id_10,
    output tri1 id_11,
    input uwire id_12,
    output supply1 id_13,
    input tri id_14,
    input tri id_15,
    input supply1 id_16,
    input tri1 id_17,
    output tri0 id_18,
    output tri1 id_19,
    input tri1 id_20,
    input tri1 id_21
);
  parameter id_23 = -1'h0;
endmodule
module module_1 #(
    parameter id_2 = 32'd41
) (
    input wor id_0,
    input wor id_1,
    input wand _id_2,
    output wor id_3,
    output tri0 id_4,
    output tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wor id_8,
    input tri id_9,
    input uwire id_10
);
  wire id_12;
  ;
  assign id_5 = id_1 || id_12;
  logic [id_2  <  -1 : -1] id_13;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_5,
      id_5,
      id_7,
      id_8,
      id_7,
      id_1,
      id_0,
      id_0,
      id_4,
      id_1,
      id_3,
      id_10,
      id_0,
      id_6,
      id_8,
      id_5,
      id_3,
      id_10,
      id_0
  );
  assign modCall_1.id_9 = 0;
  wire id_14;
  ;
  assign id_5 = id_7;
endmodule
