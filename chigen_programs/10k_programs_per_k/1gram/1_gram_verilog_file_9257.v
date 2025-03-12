// Seed: 2001162703
module module_0 #(
    parameter id_0  = 32'd43,
    parameter id_11 = 32'd70,
    parameter id_16 = 32'd83,
    parameter id_25 = 32'd90,
    parameter id_8  = 32'd99
) (
    input tri1 _id_0,
    input supply1 id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input supply1 id_5
    , id_33,
    input supply0 id_6,
    input supply0 id_7,
    output uwire _id_8,
    input tri id_9,
    output wor id_10,
    output wand _id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    input tri0 id_15,
    output supply0 _id_16[1 'b0 ?  id_25 : id_0 : id_11],
    input wire id_17,
    input tri1 id_18,
    input wand id_19,
    output uwire id_20,
    output wor id_21,
    input tri0 id_22,
    output tri1 id_23,
    input wand id_24,
    input tri0 _id_25,
    input tri0 id_26,
    input tri0 id_27[id_8 : id_16  ==  1],
    output wor id_28,
    input tri id_29,
    output tri0 id_30,
    input tri id_31
);
  logic id_34;
  logic id_35;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd36,
    parameter id_3 = 32'd11,
    parameter id_7 = 32'd68,
    parameter id_9 = 32'd67
) (
    inout supply0 _id_0,
    output tri id_1,
    input uwire id_2,
    input uwire _id_3,
    input uwire id_4
);
  wire id_6, _id_7, id_8, _id_9;
  wire [-1 : 1] id_10;
  wor [1 : id_0] id_11, id_12[1 'b0 : 1];
  logic [7:0][id_0  +  id_7  &&  id_9] id_13 = id_4;
  wire [id_3 : -1 'b0] id_14;
  assign id_0 = id_2;
  parameter id_15 = -1;
  assign id_12 = 1'd0 - 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_2
  );
  real id_16;
endmodule
