// Seed: 968983280
module module_0 #(
    parameter id_0 = 32'd24
) (
    output tri0  _id_0,
    input  tri1  id_1,
    input  tri   id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  uwire id_5 [1 : id_0  !=?  -1],
    input  wire  id_6,
    output tri0  id_7
);
  logic id_9;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_17 = 32'd40,
    parameter id_9  = 32'd4
) (
    input wor id_0,
    input tri1 id_1,
    output tri0 id_2,
    output wire id_3,
    input wire id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7,
    input uwire id_8,
    input supply1 _id_9,
    input tri id_10,
    output tri0 id_11,
    input tri id_12,
    input wor id_13,
    output tri0 id_14,
    input tri0 id_15,
    input tri1 id_16,
    input supply0 _id_17
);
  localparam id_19 = -1;
  nor primCall (
      id_11,
      id_6,
      id_22,
      id_5,
      id_1,
      id_0,
      id_24,
      id_10,
      id_21,
      id_4,
      id_12,
      id_13,
      id_23,
      id_25,
      id_16,
      id_8,
      id_7,
      id_15
  );
  logic [{  id_17  } : id_9] id_20;
  wire [1 : -1] id_21, id_22;
  localparam id_23 = id_19, id_24 = id_12, id_25 = -1;
  module_0 modCall_1 (
      id_25,
      id_10,
      id_13,
      id_10,
      id_1,
      id_0,
      id_13,
      id_11
  );
  assign modCall_1.id_4 = 0;
endmodule
