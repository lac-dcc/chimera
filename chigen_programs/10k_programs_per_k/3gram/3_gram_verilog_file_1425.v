// Seed: 743695520
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    output wire id_3,
    input tri1 id_4,
    input wand id_5,
    input uwire id_6,
    input wor id_7,
    input uwire id_8,
    input tri1 id_9,
    input supply1 id_10,
    input tri1 id_11,
    output supply0 id_12,
    input supply1 id_13,
    input supply0 id_14,
    output supply0 id_15,
    input uwire id_16,
    input tri id_17,
    input tri0 id_18,
    input tri1 id_19,
    output wand id_20,
    input tri0 id_21,
    input tri0 id_22,
    input tri0 id_23,
    input wor id_24
);
  assign id_15 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd67,
    parameter id_7 = 32'd29
) (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    output wire id_3,
    output supply0 id_4
    , id_9,
    input uwire _id_5,
    input uwire id_6,
    input uwire _id_7
);
  always @(1) begin : LABEL_0
    if (1) assert (id_7);
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_6,
      id_2,
      id_6,
      id_0,
      id_1,
      id_1,
      id_0,
      id_6,
      id_0,
      id_1,
      id_4,
      id_0,
      id_1,
      id_2,
      id_1,
      id_6,
      id_1,
      id_0,
      id_3,
      id_6,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_21 = 0;
  wire [1 : -1] id_10;
  logic id_11, id_12, id_13;
  assign id_3 = -1;
  assign id_9 = id_1 < id_11;
  id_14 :
  assert property (@(posedge 1) 1)
  else id_13 <= -1'b0;
  xor primCall (id_2, id_1, id_6, id_9, id_0);
  wire ["" -  1  ==  id_7 : -1  &&  1  ==  id_5] id_15, id_16;
endmodule
