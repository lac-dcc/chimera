// Seed: 2016981157
module module_0 (
    output wor id_0,
    input tri id_1,
    output supply1 id_2,
    input tri id_3,
    output tri id_4,
    output supply1 id_5,
    output wand id_6,
    input tri0 id_7,
    input wire id_8,
    output tri id_9,
    input tri1 id_10,
    input wand id_11,
    output tri0 id_12,
    output supply0 id_13,
    input wand id_14,
    input wor id_15,
    output wire id_16,
    input wire id_17,
    input wand id_18,
    input wor id_19,
    output supply1 id_20,
    input wire id_21,
    input wire id_22,
    output wor id_23,
    output uwire id_24,
    output uwire id_25,
    output wand id_26
);
  logic ["" : 1] id_28, id_29;
  assign id_24 = id_22;
  logic id_30;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd62,
    parameter id_13 = 32'd25,
    parameter id_3  = 32'd33,
    parameter id_6  = 32'd97,
    parameter id_8  = 32'd96,
    parameter id_9  = 32'd18
) (
    input supply1 _id_0,
    input wire id_1,
    output supply1 id_2,
    output supply1 _id_3,
    output wire id_4,
    input wire id_5,
    input tri _id_6,
    input wire id_7,
    output wand _id_8,
    input tri0 _id_9,
    input wor id_10
);
  logic [id_9 : ~  id_8  +  -1] id_12;
  ;
  wire _id_13;
  logic [7:0][1 : -1] id_14;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_1,
      id_2,
      id_2,
      id_4,
      id_5,
      id_5,
      id_4,
      id_1,
      id_7,
      id_4,
      id_4,
      id_10,
      id_7,
      id_4,
      id_7,
      id_7,
      id_5,
      id_2,
      id_5,
      id_10,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_14[{id_9} : id_6==id_0] = id_7 ^ -1 ** id_7;
  initial begin : LABEL_0
    wait (1);
  end
  wire id_15;
  ;
  logic [id_3  |  id_9 : id_13] id_16;
endmodule
