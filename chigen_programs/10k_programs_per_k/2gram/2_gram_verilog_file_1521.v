// Seed: 2898329574
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    output tri1 id_4,
    input supply1 id_5,
    output tri id_6,
    input supply0 id_7,
    input wire id_8,
    input tri1 id_9,
    output tri0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri id_13,
    input supply0 id_14,
    input tri id_15,
    output tri1 id_16,
    input supply0 id_17,
    input wire id_18,
    output wire id_19,
    input tri id_20,
    output wor id_21,
    input uwire id_22,
    input tri id_23,
    input tri1 id_24
);
  assign id_16 = id_23;
endmodule
module module_1 #(
    parameter id_0  = 32'd34,
    parameter id_15 = 32'd78,
    parameter id_5  = 32'd67
) (
    input wire _id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    input tri1 _id_5,
    inout wand id_6,
    output tri0 id_7,
    input uwire id_8,
    input tri id_9,
    input wor id_10,
    input supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri0 id_14,
    input supply0 _id_15
);
  wire id_17;
  logic [-1 'b0 : {  id_0  ,  id_5  ? "" : id_15  ,  -1 'b0 }] id_18;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_3,
      id_6,
      id_7,
      id_3,
      id_7,
      id_3,
      id_10,
      id_13,
      id_6,
      id_11,
      id_11,
      id_13,
      id_8,
      id_10,
      id_6,
      id_2,
      id_3,
      id_7,
      id_11,
      id_7,
      id_11,
      id_13,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
