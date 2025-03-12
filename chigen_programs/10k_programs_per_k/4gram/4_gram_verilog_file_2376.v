// Seed: 3005195984
module module_0 (
    input tri id_0,
    output wand id_1,
    output wand id_2,
    input tri0 id_3,
    output wire id_4,
    output wor id_5
    , id_24,
    input wor id_6,
    input tri1 id_7,
    input uwire id_8,
    output tri0 id_9,
    input supply1 id_10,
    output wand id_11,
    input wand id_12,
    input supply0 id_13,
    output tri1 id_14,
    output wire id_15,
    input wor id_16,
    output wire id_17,
    input tri0 id_18,
    input supply1 id_19,
    output wand id_20,
    output tri1 id_21,
    input tri id_22
);
  generate
    logic id_25 = id_7, id_26;
  endgenerate
endmodule
module module_1 #(
    parameter id_19 = 32'd5,
    parameter id_2  = 32'd39
) (
    output uwire id_0,
    input  tri0  id_1,
    output tri1  _id_2,
    input  wand  id_3,
    output wor   id_4,
    output tri0  id_5,
    output wand  id_6,
    output tri1  id_7
);
  wire  id_9;
  logic id_10[1 : -1];
  if (1'h0 - 1) begin : LABEL_0
    logic [-1 : id_2] id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  end
  wire [ (  1  ) : -1] _id_19;
  wire [id_19 : 1 'o0] id_20;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_1,
      id_1,
      id_1,
      id_6,
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_6,
      id_3,
      id_5,
      id_3,
      id_1,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
  wire id_21;
endmodule
