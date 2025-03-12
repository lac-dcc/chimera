// Seed: 1490402339
module module_0 (
    output uwire id_0,
    input wor id_1,
    input tri0 id_2,
    output wor id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output tri0 id_7,
    input wor id_8
    , id_22,
    input uwire id_9,
    output uwire id_10#(1, 1, -1),
    input wire id_11,
    input uwire id_12,
    output tri0 id_13,
    input tri1 id_14,
    input tri0 id_15,
    input uwire id_16,
    input wor id_17,
    input tri0 id_18
    , id_23,
    input uwire id_19,
    input tri id_20
);
  wire id_24;
  assign id_3 = id_22;
endmodule
module module_1 #(
    parameter id_0 = 32'd59,
    parameter id_1 = 32'd63
) (
    input supply0 _id_0,
    input wor _id_1,
    input wand id_2,
    output tri id_3,
    output wire id_4,
    input uwire id_5
);
  logic [-1 : -1] id_7;
  ;
  assign id_3 = 1;
  logic id_8;
  logic [id_0 : id_1] id_9 = id_5;
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_4,
      id_5,
      id_2,
      id_3,
      id_5,
      id_2,
      id_4,
      id_5,
      id_2,
      id_4,
      id_2,
      id_5,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_20 = 0;
endmodule
