// Seed: 2204800093
program module_0 #(
    parameter id_11 = 32'd95
) (
    input tri1 id_0,
    input wor id_1,
    output tri0 id_2
    , _id_11,
    input wor id_3,
    output uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    input tri1 id_7,
    output supply0 id_8,
    output supply0 id_9
);
  logic id_12, id_13[id_11 : -1];
  assign module_1.id_16 = 0;
endprogram
module module_1 #(
    parameter id_1  = 32'd46,
    parameter id_21 = 32'd90
) (
    input supply1 id_0,
    output wand _id_1,
    input tri id_2,
    output wand id_3,
    input tri0 id_4,
    output tri id_5,
    inout wire id_6,
    input wor id_7
    , _id_21,
    input wor id_8,
    input supply1 id_9,
    output supply1 id_10,
    input wand id_11,
    input wire id_12,
    input uwire id_13,
    input tri id_14,
    output tri0 id_15,
    input tri1 id_16,
    output wor id_17,
    input tri id_18,
    input tri0 id_19
);
  wire ['0 : ""] id_22;
  generate
    wire id_23[1 : -1  ==  -1], id_24;
    wire id_25[id_1 : -1 'b0];
    ;
  endgenerate
  parameter id_26 = -1;
  localparam id_27 = id_26, id_28 = -1;
  nand primCall (
      id_5, id_16, id_29, id_12, id_9, id_19, id_22, id_6, id_13, id_28, id_4, id_2, id_27, id_26
  );
  assign id_3 = id_7.product;
  logic id_29[-1 : id_21];
  module_0 modCall_1 (
      id_0,
      id_12,
      id_15,
      id_12,
      id_15,
      id_2,
      id_12,
      id_2,
      id_5,
      id_5
  );
endmodule
