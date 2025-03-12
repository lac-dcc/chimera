// Seed: 631527788
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output tri   id_2
);
  assign id_2 = 1'h0 == id_1;
  assign module_1.id_14 = 0;
  assign id_2 = id_0;
endmodule
module module_1 #(
    parameter id_16 = 32'd93,
    parameter id_9  = 32'd18
) (
    input wand id_0,
    input tri0 id_1,
    input wire id_2,
    output wor id_3,
    input tri id_4,
    input wor id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input wand _id_9,
    input wand id_10,
    input supply0 id_11,
    input tri1 id_12,
    input wire id_13,
    input wand id_14
    , id_18,
    output tri1 id_15,
    input tri0 _id_16
    , id_19
);
  logic id_20;
  always @(posedge id_5 or id_4) begin : LABEL_0
    id_19[-1 : id_9] = id_13;
  end
  nand primCall (
      id_3,
      id_0,
      id_10,
      id_14,
      id_7,
      id_4,
      id_8,
      id_11,
      id_20,
      id_13,
      id_12,
      id_6,
      id_2,
      id_18,
      id_1
  );
  module_0 modCall_1 (
      id_6,
      id_2,
      id_3
  );
  wire [1 : id_16] id_21;
  wire id_22, id_23;
endmodule
