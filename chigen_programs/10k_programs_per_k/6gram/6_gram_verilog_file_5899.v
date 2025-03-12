// Seed: 2774916036
module module_0 (
    input wor id_0,
    input uwire id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    output supply1 id_7,
    input tri1 id_8,
    output wor module_0,
    input tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    output wor id_14,
    input uwire id_15,
    output wire id_16,
    input tri0 id_17,
    input wor id_18,
    input tri0 id_19,
    input wire id_20,
    input wire id_21,
    input wire id_22,
    output wire id_23
);
  always @(posedge -1'b0 or posedge 1) begin : LABEL_0
    $clog2(30);
    ;
    fork
      id_25(-1, 1);
    join
  end
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd81,
    parameter id_23 = 32'd93,
    parameter id_5  = 32'd58
) (
    input supply0 id_0,
    input tri id_1,
    input tri id_2,
    output wor id_3,
    input tri id_4,
    input wand _id_5
    , id_22,
    output wor id_6,
    input uwire id_7,
    input uwire id_8,
    input wand id_9,
    input tri0 id_10,
    input wor id_11,
    input supply1 _id_12,
    input tri0 id_13,
    output wand id_14,
    output wand id_15,
    output supply1 id_16
    , _id_23,
    input supply0 id_17,
    output wand id_18,
    output wand id_19,
    output wand id_20
);
  wire [id_12  !=  1 : id_5] id_24;
  wire [{  -1  ,  id_23  -  1  } : -1] id_25;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_1,
      id_2,
      id_9,
      id_2,
      id_0,
      id_3,
      id_7,
      id_14,
      id_9,
      id_8,
      id_10,
      id_4,
      id_3,
      id_10,
      id_3,
      id_10,
      id_17,
      id_9,
      id_8,
      id_17,
      id_10,
      id_19
  );
endmodule
