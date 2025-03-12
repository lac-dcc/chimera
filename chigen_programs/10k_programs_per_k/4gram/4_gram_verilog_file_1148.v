// Seed: 3826635984
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input wire id_2,
    output supply1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wire id_7,
    input tri id_8,
    input wire id_9,
    input wand id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri0 id_13,
    output wire id_14,
    input wand id_15
);
  wire [-1 : -1] id_17;
  bit \id_18 ;
  wire id_19;
  initial begin : LABEL_0
    \id_18 <= id_17;
  end
  assign id_19 = 1;
endmodule
module module_1 #(
    parameter id_0  = 32'd47,
    parameter id_13 = 32'd7,
    parameter id_4  = 32'd58
) (
    input wand _id_0,
    input wor id_1,
    input uwire id_2,
    input uwire id_3,
    output supply0 _id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7
    , _id_13,
    output uwire id_8,
    input uwire id_9,
    input tri1 id_10,
    output tri id_11
);
  assign id_8 = id_6;
  logic [(  1 'b0 ) : -1] id_14;
  ;
  logic [-1 : id_0] id_15;
  supply1 id_16 = 1;
  logic id_17;
  ;
  logic id_18;
  ;
  logic id_19[id_4 : -1];
  assign id_14 = id_3;
  struct packed {
    id_20 id_21;
    logic [1 'b0 : id_13] id_22;
  } id_23;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_6,
      id_11,
      id_6,
      id_6,
      id_6,
      id_9,
      id_9,
      id_9,
      id_6,
      id_5,
      id_10,
      id_6,
      id_11,
      id_1
  );
  parameter id_24 = -1'b0;
  assign id_19 = id_16;
  parameter id_25 = 1;
  assign id_15 = id_23.id_20;
  xor primCall (
      id_8,
      id_23,
      id_16,
      id_21,
      id_5,
      id_10,
      id_22,
      id_7,
      id_3,
      id_18,
      id_20,
      id_17,
      id_14,
      id_2,
      id_19,
      id_9,
      id_15,
      id_6
  );
  assign id_23.id_22 = -1;
  assign id_23 = (1);
  initial id_23.id_21 = id_2;
  wire id_26;
endmodule
