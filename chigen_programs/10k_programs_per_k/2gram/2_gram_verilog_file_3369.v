// Seed: 220319852
module module_0;
  uwire [-1 : 1] id_1;
  assign module_1.id_7 = 0;
  assign id_1 = -1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output supply0 id_2,
    output logic id_3
);
  wire id_5;
  always_ff begin : LABEL_0
    if (1) id_3 = id_0;
    else id_3 = -1;
  end
  logic id_6, id_7 = -1, id_8;
  parameter id_9 = 1'b0 ? 1 : 1 ? 1 : 1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_10 = 32'd70,
    parameter id_11 = 32'd18,
    parameter id_13 = 32'd11,
    parameter id_19 = 32'd42,
    parameter id_2  = 32'd32,
    parameter id_4  = 32'd96
) (
    output wire id_0,
    output tri1 id_1,
    input supply1 _id_2,
    output wand id_3,
    input tri _id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri id_7,
    input wor id_8
    , id_15,
    input supply1 id_9,
    input supply0 _id_10,
    input supply1 _id_11,
    input supply1 id_12,
    input wire _id_13
);
  logic [-1 : id_11  #  (  id_13  ,  id_4  ,  id_10  ?  1 : -1  ,  1  )] id_16;
  wire [!  -1  !=?  id_2 : -1 'b0] id_17;
  logic [7:0] id_18;
  wire _id_19;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire [1 : id_19] id_20, id_21;
  assign id_17 = id_4;
  wire id_22;
  bit [-1  == "" : 1] id_23, id_24, id_25, id_26, id_27;
  logic id_28 = -1'b0;
  xnor primCall (id_0, id_12, id_15, id_16, id_17, id_18, id_5, id_6, id_8, id_9);
  assign id_7 = -1;
  id_29 :
  assert property (@(posedge id_10) id_28)
  else;
  always id_15 <= id_27 !=? "";
  initial id_24 <= id_23;
  assign id_18[id_19 : 1/-1'd0] = 1;
  assign id_7 = id_24;
endmodule
