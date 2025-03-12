// Seed: 2954907620
module module_0 (
    input  tri1  id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  tri   id_4,
    input  uwire id_5,
    output uwire id_6,
    output tri0  id_7
);
  logic id_9, id_10, id_11, id_12;
  wire  id_13 = id_4;
  logic id_14;
endmodule
module module_1 #(
    parameter id_1 = 32'd79
) (
    output tri1 id_0,
    input tri _id_1,
    input wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input wand id_6,
    output tri id_7,
    input tri0 id_8,
    input uwire id_9,
    input wor id_10,
    output tri1 id_11,
    input tri id_12,
    output uwire id_13
    , id_18,
    output supply1 id_14,
    input supply1 id_15,
    input wire id_16
);
  assign id_18 = id_12;
  wire id_19;
  wire [{  id_1  ,  1  } : 1 'b0] id_20;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_5,
      id_10,
      id_3,
      id_7,
      id_11
  );
  assign id_18[-1] = 1 == (id_12 || id_9) && id_1;
  assign id_13 = 1'd0 || id_19;
  logic id_21;
endmodule
