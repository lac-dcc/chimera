// Seed: 2581078966
module module_0 (
    output tri id_0,
    input  tri id_1
);
  wire id_3, id_4, id_5;
  assign module_1.id_15 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd81,
    parameter id_14 = 32'd93,
    parameter id_17 = 32'd58
) (
    input tri _id_0,
    input wor id_1[id_17 : id_0  |  1 'b0],
    output supply0 id_2,
    input wor id_3,
    input uwire id_4,
    output tri0 id_5,
    output supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    output wand id_9,
    output uwire id_10,
    input wand id_11,
    output wand id_12,
    input uwire id_13,
    input wand _id_14,
    input tri id_15,
    input tri id_16,
    output wand _id_17,
    input wand id_18,
    input supply1 id_19[1 : 1],
    input supply0 id_20,
    input wand id_21,
    input wand id_22,
    input wand id_23
);
  wire [-1 : id_14] id_25;
  wire id_26[1 'd0 : 1];
  xnor primCall (
      id_12,
      id_11,
      id_26,
      id_1,
      id_25,
      id_18,
      id_3,
      id_15,
      id_21,
      id_8,
      id_20,
      id_16,
      id_4,
      id_19,
      id_22,
      id_23,
      id_13
  );
  module_0 modCall_1 (
      id_5,
      id_11
  );
  always begin : LABEL_0
    @(posedge 1 or negedge id_1);
  end
endmodule
