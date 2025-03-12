// Seed: 3623677480
module module_0 (
    output tri1 id_0,
    output wor id_1,
    input tri id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri id_5,
    input tri id_6,
    input wor id_7,
    input tri0 id_8,
    input tri id_9,
    output tri1 id_10,
    output uwire id_11,
    input wor id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri1 id_15,
    output uwire id_16,
    output tri0 id_17,
    input tri id_18
    , id_20
);
  assign id_20 = id_6;
  logic id_21 = id_6;
  logic id_22, id_23;
  wire id_24;
  tri id_25 = 1;
  integer id_26;
  parameter id_27 = 1, id_28 = 1'b0, id_29 = id_15, id_30 = -1, id_31 = id_23, id_32 = id_20;
  wire id_33;
  ;
  parameter id_34 = id_32 - 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd86,
    parameter id_5 = 32'd92
) (
    output wor id_0,
    output supply1 id_1,
    input supply0 id_2,
    inout supply1 _id_3,
    output tri id_4,
    input wand _id_5
);
  supply1 [id_3 : id_5] id_7 = 1, id_8 = id_8;
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_12 = 0;
  wire id_10;
  ;
endmodule
