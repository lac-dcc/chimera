// Seed: 2722351589
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input wor id_2,
    output wire id_3,
    input tri0 id_4,
    input wor id_5,
    output wire id_6,
    output uwire id_7,
    output uwire id_8
);
  logic id_10[-1 : -1];
endmodule
module module_1 #(
    parameter id_12 = 32'd10,
    parameter id_7  = 32'd55
) (
    input supply1 id_0,
    output wor id_1,
    input wor id_2,
    input tri0 id_3,
    output wire id_4,
    input tri1 id_5,
    output wire id_6,
    output uwire _id_7,
    output wand id_8,
    output wire id_9,
    output wor id_10,
    input wire id_11,
    input uwire _id_12,
    output tri1 id_13,
    output wand id_14[id_7 : 1  -  1],
    input tri1 id_15,
    input tri id_16
);
  bit   id_18;
  logic id_19;
  bit id_20, id_21;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_5,
      id_4,
      id_0,
      id_5,
      id_6,
      id_9,
      id_9
  );
  assign modCall_1.id_5 = 0;
  id_22 :
  assert property (@* 1) id_18 <= id_3;
  reg id_23, id_24, id_25;
  localparam id_26 = 1;
  always @(posedge -1 | 1'b0 or -1'b0) id_21 = id_22;
  initial id_24 <= -1;
  assign #1 id_1 = id_15;
  wire ["" : id_12] id_27[1 : -1];
endmodule
