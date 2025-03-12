// Seed: 3325826698
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output tri id_3,
    input wire id_4,
    input wor id_5,
    input uwire id_6,
    input wand id_7,
    input tri0 id_8,
    output wand id_9,
    output tri1 id_10,
    input wand id_11,
    input tri0 id_12,
    input wand id_13
);
  localparam id_15 = -1;
  wire id_16;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd66,
    parameter id_4 = 32'd70
) (
    input uwire id_0,
    input tri id_1,
    input wand _id_2,
    input wand id_3,
    input uwire _id_4,
    output wor id_5,
    output logic id_6,
    input wire id_7,
    input uwire id_8,
    input tri1 id_9,
    output wand id_10
    , id_19,
    input supply1 id_11,
    input uwire id_12,
    output supply1 id_13,
    output wor id_14,
    input wire id_15,
    output tri0 id_16,
    input wand id_17
);
  always @(posedge -id_0 or id_8) begin : LABEL_0
    disable id_20;
    id_6  <= 1;
    id_19 <= id_17 == 1;
  end
  wire [id_2 : id_4  ==  -1] id_21;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_10,
      id_14,
      id_8,
      id_12,
      id_3,
      id_7,
      id_11,
      id_10,
      id_5,
      id_15,
      id_15,
      id_12
  );
  assign modCall_1.id_3 = 0;
  parameter id_22 = 1 != 1;
  logic id_23;
endmodule
