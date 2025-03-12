// Seed: 3830154298
module module_0 (
    output wand id_0,
    output tri0 id_1,
    output tri1 id_2,
    input supply1 id_3,
    output supply1 id_4,
    output wor id_5,
    input uwire id_6,
    output supply0 id_7,
    input uwire id_8,
    output wire id_9
);
  wire [1 : 1] id_11;
  assign module_1.id_30 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd60
) (
    output supply0 id_0,
    input uwire id_1,
    output tri id_2,
    input supply0 id_3,
    input wire id_4,
    input wor id_5,
    output tri id_6,
    output tri id_7,
    output supply0 id_8,
    input wire id_9,
    input supply0 id_10,
    input wand id_11,
    output wire id_12,
    input uwire _id_13,
    output uwire id_14,
    output tri1 id_15,
    input tri1 id_16,
    input wand id_17
);
  integer [-1 : 1 'b0] id_19;
  logic id_20, id_21;
  bit [1 : {  1  ,  id_13  &  1 'd0 }] id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29,
      id_30, id_31;
  nand primCall (
      id_6,
      id_23,
      id_9,
      id_21,
      id_4,
      id_20,
      id_3,
      id_10,
      id_5,
      id_25,
      id_22,
      id_19,
      id_1,
      id_27,
      id_29,
      id_24,
      id_30,
      id_11,
      id_31
  );
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_11,
      id_15,
      id_7,
      id_17,
      id_8,
      id_10,
      id_6
  );
  always @(negedge 1 + (id_26) - -1) begin : LABEL_0
    id_31 = #id_32 id_11;
  end
  assign id_20 = id_26;
endmodule
