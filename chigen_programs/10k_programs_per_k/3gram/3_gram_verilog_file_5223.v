// Seed: 725256501
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri id_4,
    input supply0 id_5,
    output wor id_6,
    output tri1 id_7,
    input supply1 id_8,
    output wor id_9,
    output uwire id_10,
    output tri1 id_11,
    input tri id_12
);
  parameter id_14 = 1;
  assign id_6 = (-1'h0) == ~id_14;
  wor id_15 = 1;
  assign id_7 = 1;
  wire id_16;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd48,
    parameter id_7 = 32'd72
) (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    input tri1 _id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    output supply0 _id_7,
    input wand id_8,
    input uwire id_9,
    output supply0 id_10,
    output wire id_11,
    output tri0 id_12,
    input tri id_13,
    output wand id_14,
    output tri0 id_15,
    output uwire id_16,
    input supply1 id_17,
    output tri1 id_18,
    input tri1 id_19
);
  logic [id_7 : id_3] id_21, id_22;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_11,
      id_1,
      id_2,
      id_5,
      id_11,
      id_2,
      id_16,
      id_5,
      id_18,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
