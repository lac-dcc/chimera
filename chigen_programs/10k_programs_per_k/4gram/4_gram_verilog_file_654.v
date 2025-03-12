// Seed: 1667417251
module module_0 (
    output tri1 id_0,
    output wor  id_1
);
  parameter id_3 = 1;
endmodule
module module_1 #(
    parameter id_17 = 32'd26,
    parameter id_24 = 32'd22,
    parameter id_28 = 32'd65
) (
    input wor id_0,
    input supply1 id_1,
    output wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    output uwire id_5,
    input supply1 id_6,
    input wor id_7,
    output tri id_8,
    output tri1 id_9,
    input tri0 id_10,
    input uwire id_11,
    input wire id_12,
    output wor id_13,
    output wor id_14,
    output tri id_15
);
  wire [1 : -1 'b0] _id_17;
  module_0 modCall_1 (
      id_15,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign id_8 = id_3;
  wire id_18;
  reg [-1 : id_17]
      id_19, id_20, id_21, id_22, id_23, _id_24, id_25, id_26, id_27, _id_28, id_29, id_30, id_31;
  always_ff @*;
  always @(posedge id_25) if (1) id_21 = -1'b0 == id_25;
  logic id_32;
  assign id_32[id_24-:id_28] = 1'b0;
endmodule
