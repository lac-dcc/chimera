// Seed: 865022375
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output wire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input wor id_13,
    input tri id_14
);
  parameter id_16 = -1'h0;
  logic id_17;
endmodule
module module_1 #(
    parameter id_5 = 32'd13,
    parameter id_6 = 32'd26
) (
    input wire id_0,
    input uwire id_1,
    output uwire id_2,
    input tri id_3,
    input supply1 id_4,
    input supply1 _id_5,
    input supply0 _id_6,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    output supply1 id_10
);
  assign id_10 = id_3;
  wire [id_6 : id_5  +  id_6  ^  1] id_12;
  logic id_13;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_10,
      id_9,
      id_7,
      id_10,
      id_8,
      id_8,
      id_0,
      id_4,
      id_1,
      id_10,
      id_4,
      id_0,
      id_8
  );
  assign modCall_1.id_14 = 0;
  logic id_14;
  always id_14 <= 1;
endmodule
