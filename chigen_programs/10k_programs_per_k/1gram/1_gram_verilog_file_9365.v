// Seed: 3907471202
module module_0 (
    output wand id_0,
    output tri0 id_1,
    output supply1 id_2,
    output uwire id_3,
    input wire id_4,
    input tri1 id_5#(
        .id_24  (-1 & -1),
        .id_25  (1'd0),
        .id_26  (-1),
        .\id_27 (-1),
        .id_28  (1),
        .id_29  (-1'b0)
    ),
    input wand id_6,
    output tri id_7,
    input supply0 id_8,
    input tri id_9,
    input uwire id_10,
    output supply0 id_11,
    output supply1 id_12,
    output tri id_13,
    input uwire id_14,
    input tri id_15,
    input tri1 id_16,
    output wor id_17,
    input uwire id_18,
    input supply0 id_19,
    input supply0 id_20,
    output supply1 id_21,
    input wor id_22
);
  generate
    logic [7:0][1] id_30;
    logic id_31;
    wire id_32;
    ;
  endgenerate
endmodule
module module_1 #(
    parameter id_0 = 32'd87
) (
    output wand  _id_0,
    input  wor   id_1,
    output uwire id_2#(.id_5(1)),
    input  uwire id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_6[id_0 : -1], id_7;
  wire [1 'b0 : (  1  )] id_8;
  wire id_9;
endmodule
