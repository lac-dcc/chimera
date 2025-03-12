// Seed: 3873109590
module module_0 (
    output supply0 id_0,
    input tri1 module_0,
    input wor id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri1 id_5,
    input supply0 id_6,
    output tri id_7,
    input uwire id_8,
    input tri0 id_9,
    input tri id_10,
    output tri id_11,
    output tri0 id_12,
    input uwire id_13,
    output wor id_14,
    output tri id_15,
    input wand id_16,
    output tri0 id_17,
    input tri1 id_18,
    input tri id_19
);
  generate
    assign id_4 = id_8;
  endgenerate
endmodule
module module_1 #(
    parameter id_1  = 32'd49,
    parameter id_10 = 32'd13,
    parameter id_4  = 32'd79,
    parameter id_7  = 32'd34,
    parameter id_9  = 32'd16
) (
    input uwire id_0,
    input tri0 _id_1,
    input tri id_2,
    input supply1 id_3,
    input tri1 _id_4,
    output wor id_5,
    output supply1 id_6,
    input supply1 _id_7
);
  logic [{  -1  ,  1  &&  id_1  } : -1 'd0] _id_9[id_4 : 1  -  id_7];
  ;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_0,
      id_6,
      id_2,
      id_3,
      id_3,
      id_6,
      id_5,
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_0
  );
  assign modCall_1.id_16 = 0;
  wire _id_10;
  wire [id_10 : id_9] id_11;
  logic id_12;
endmodule
