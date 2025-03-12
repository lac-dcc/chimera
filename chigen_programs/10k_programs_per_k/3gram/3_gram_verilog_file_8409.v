// Seed: 1387788804
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    input uwire id_6,
    input wor id_7,
    input supply1 id_8,
    output wand id_9,
    output tri1 id_10,
    output wand id_11,
    input tri id_12,
    output wand id_13,
    input supply0 id_14,
    input wire id_15,
    input uwire id_16,
    input supply0 id_17,
    output tri id_18,
    input tri1 id_19,
    output supply1 id_20,
    output supply0 id_21,
    output supply0 id_22
);
  parameter [-1 : -1] id_24 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd54
) (
    input supply0 id_0,
    input wor _id_1,
    output uwire id_2
);
  static logic [-1 : id_1] id_4;
  logic id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_21 = 0;
endmodule
