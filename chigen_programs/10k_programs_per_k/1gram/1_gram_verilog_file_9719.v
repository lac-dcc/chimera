// Seed: 1361604186
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input wand id_2,
    output tri1 id_3,
    output wor id_4,
    input tri id_5
    , id_20 = 1,
    output tri0 id_6,
    input tri id_7,
    input tri0 id_8,
    input tri id_9,
    input wor id_10,
    input wand id_11,
    input supply1 id_12,
    input supply1 id_13,
    output wire id_14,
    output wor id_15,
    output supply1 id_16,
    input tri id_17,
    input wire id_18
);
  assign id_20 = id_1;
  assign id_6  = $clog2(90);
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd77
) (
    output tri0 id_0,
    output wire id_1,
    output tri id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wor id_5,
    output wor id_6,
    input supply1 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    output wor id_11,
    input wor id_12[1 : id_13],
    input wire _id_13,
    input tri0 id_14,
    input supply0 id_15
);
  wire [id_13 : 1] id_17;
  parameter id_18 = (1);
  logic id_19;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_10,
      id_2,
      id_2,
      id_14,
      id_4,
      id_10,
      id_3,
      id_10,
      id_10,
      id_12,
      id_15,
      id_12,
      id_4,
      id_11,
      id_1,
      id_10,
      id_8
  );
  assign modCall_1.id_17 = 0;
endmodule
