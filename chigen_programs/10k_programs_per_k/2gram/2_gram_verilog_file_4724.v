// Seed: 1695183986
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input wor id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    output wand id_8,
    input tri id_9,
    input tri1 id_10,
    input supply1 id_11,
    output tri1 id_12,
    output wire id_13
    , id_15
);
  always_ff @(posedge -1 or negedge -1 == id_10) begin : LABEL_0
    #1 assume (1);
  end
endmodule
module module_1 #(
    parameter id_7 = 32'd38
) (
    output supply1 id_0,
    output wand id_1,
    input tri0 id_2,
    output tri1 id_3,
    output wire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input supply1 _id_7
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_6,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire [id_7 : id_7] id_9;
  wire id_10, id_11, id_12, id_13, id_14, id_15;
  wand  id_16 = -1;
  logic id_17;
endmodule
