// Seed: 286989873
module module_0 (
    output tri0 id_0,
    input  wire id_1,
    input  wand id_2,
    input  wire id_3
);
  wire id_5;
  assign id_0 = 1;
  wire id_6;
  parameter id_7 = 1;
  assign module_1.id_12 = 0;
  parameter id_8 = 1;
  localparam id_9 = 1, id_10 = 1, id_11 = id_10, id_12 = -1;
endmodule
module module_1 #(
    parameter id_0  = 32'd6,
    parameter id_15 = 32'd95,
    parameter id_4  = 32'd39
) (
    inout wire _id_0,
    output tri1 id_1,
    input tri id_2,
    output tri0 id_3,
    input wire _id_4,
    output tri1 id_5,
    output tri0 id_6,
    input supply1 id_7,
    output wire id_8,
    input wire id_9,
    output wire id_10,
    output wor id_11,
    output supply1 id_12,
    output tri id_13,
    input tri id_14,
    input tri _id_15,
    input supply1 id_16,
    input tri id_17
);
  wire [1 : {  1  ,  1 'b0 ,  id_15  <<  id_0  ,  id_4  ==  id_0  ,  id_15  }] id_19;
  wire [id_4 : 1] id_20;
  module_0 modCall_1 (
      id_6,
      id_16,
      id_14,
      id_2
  );
  assign id_3 = ~1'h0;
  nand primCall (id_5, id_19, id_2, id_20, id_14, id_7, id_17, id_16, id_9);
endmodule
