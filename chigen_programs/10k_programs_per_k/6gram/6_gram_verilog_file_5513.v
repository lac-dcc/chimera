// Seed: 2321052441
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input supply1 id_2,
    output tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    input wire id_6,
    input uwire id_7,
    output tri id_8
);
  wire id_10;
  reg  id_11;
  localparam id_12 = 1'b0;
  always @(1, posedge id_11) begin : LABEL_0
    id_11 <= -1;
  end
endmodule
module module_1 #(
    parameter id_13 = 32'd89,
    parameter id_16 = 32'd32,
    parameter id_7  = 32'd54
) (
    input uwire id_0,
    output wand id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wire id_4,
    output tri id_5,
    input tri1 id_6,
    input tri1 _id_7,
    input tri0 id_8,
    output supply1 id_9,
    input wand id_10,
    input wor id_11,
    output tri id_12,
    input tri _id_13,
    input supply1 id_14,
    output wire id_15,
    input supply1 _id_16,
    input supply1 id_17
    , id_24,
    input tri0 id_18,
    input wand id_19,
    input tri1 id_20,
    input wor id_21,
    output tri0 id_22
);
  assign id_4 = id_20;
  wire [id_7 : 1  ==  1] id_25;
  or primCall (
      id_2, id_6, id_20, id_8, id_10, id_0, id_25, id_11, id_17, id_21, id_14, id_18, id_3, id_24
  );
  module_0 modCall_1 (
      id_21,
      id_10,
      id_21,
      id_2,
      id_0,
      id_20,
      id_3,
      id_11,
      id_2
  );
  assign modCall_1.id_11 = 0;
  wire id_26;
  wire [1  !=?  1 'd0 : 1] id_27;
  logic [id_16 : id_13  -  -1] id_28;
  logic id_29, id_30;
endmodule
