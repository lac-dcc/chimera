// Seed: 2533149479
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wire id_3,
    input wire id_4,
    output wand id_5,
    output tri0 id_6,
    input supply0 id_7,
    input tri0 id_8
);
  wire id_10;
  wire \id_11 ;
  wire id_12;
endmodule
module module_1 #(
    parameter id_1 = 32'd74,
    parameter id_8 = 32'd21
) (
    input uwire id_0,
    input tri _id_1,
    output tri0 id_2,
    input wire id_3,
    input wand id_4,
    input tri0 id_5,
    output supply1 id_6,
    output logic id_7,
    output wand _id_8,
    output logic id_9,
    input wand id_10,
    input wand id_11,
    input supply0 id_12,
    input tri1 id_13,
    output wor id_14
    , id_26,
    output wor id_15,
    input tri1 id_16,
    input tri0 id_17,
    input supply1 id_18,
    output wand id_19,
    input tri1 id_20,
    input tri id_21,
    output uwire id_22,
    output wand id_23,
    input uwire id_24
);
  logic [id_8 : id_1] id_27;
  module_0 modCall_1 (
      id_21,
      id_10,
      id_13,
      id_16,
      id_11,
      id_19,
      id_14,
      id_18,
      id_3
  );
  assign modCall_1.id_8 = 0;
  always @(posedge id_10) begin : LABEL_0
    id_9 <= id_3;
    id_7 = 1'b0;
  end
  wire id_28 = (id_10);
  wire id_29 = id_4;
endmodule
