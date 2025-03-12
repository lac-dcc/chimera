// Seed: 3628932534
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    output supply1 id_3,
    output wand id_4,
    input wire id_5,
    input uwire id_6,
    input tri1 id_7,
    input supply1 id_8,
    output wire id_9,
    input tri1 id_10,
    output tri0 id_11,
    output supply0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    input tri0 id_16
    , id_23,
    output uwire id_17,
    output tri0 id_18,
    output wor id_19,
    output tri1 id_20,
    input uwire id_21
);
  wire  id_24;
  uwire id_25 = -1;
  assign id_18 = id_10;
  logic id_26 = -1;
endmodule
module module_1 #(
    parameter id_18 = 32'd71
) (
    output wor id_0
    , id_24,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wor id_6,
    output tri id_7,
    input wire id_8,
    output wor id_9,
    input wor id_10,
    input supply1 id_11,
    input wor id_12,
    input uwire id_13,
    input wor id_14,
    output wor id_15,
    output tri0 id_16,
    input supply1 id_17,
    input tri _id_18,
    output tri id_19,
    input supply1 id_20,
    input supply0 id_21,
    input wire id_22
);
  reg id_25;
  always @(posedge id_12 or posedge 1) begin : LABEL_0
    id_25 <= -1;
  end
  assign id_16 = id_14;
  wire [-1 'd0 &  -1 : id_18] id_26;
  module_0 modCall_1 (
      id_21,
      id_1,
      id_3,
      id_9,
      id_0,
      id_12,
      id_20,
      id_17,
      id_4,
      id_9,
      id_3,
      id_5,
      id_16,
      id_4,
      id_22,
      id_22,
      id_8,
      id_5,
      id_16,
      id_5,
      id_7,
      id_10
  );
  assign modCall_1.id_13 = 0;
  parameter id_27 = -1'd0;
endmodule
