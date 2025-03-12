// Seed: 1027929582
module module_0 #(
    parameter id_19 = 32'd7
) (
    output tri1 id_0,
    input wand id_1
    , id_15,
    output uwire id_2,
    input tri id_3,
    output uwire id_4,
    output wand id_5,
    input wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri1 id_9,
    output wor id_10,
    input wor id_11,
    input wire id_12,
    input tri0 id_13
);
  assign id_9 = 1;
  localparam id_16 = 1'b0 && 1;
  parameter id_17 = id_16;
  assign module_1._id_2 = 0;
  wire  id_18  ,  _id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  [  id_19  :  -1  ]  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ;
  tri1 id_36 = -1;
  wire id_37, id_38, id_39, id_40, id_41, id_42, id_43, id_44;
  initial id_30 += -1;
  parameter id_45 = id_16;
endmodule
module module_1 #(
    parameter id_1 = 32'd53,
    parameter id_2 = 32'd86,
    parameter id_8 = 32'd65
) (
    input tri0 id_0,
    input supply1 _id_1,
    input tri0 _id_2,
    output supply0 id_3,
    output tri id_4,
    output tri1 id_5,
    output tri0 id_6,
    input uwire id_7,
    output tri1 _id_8,
    input tri0 id_9,
    input wire id_10,
    output wire id_11,
    output wand id_12,
    output tri0 id_13
);
  logic [id_8 : {  id_2  ,  1  }] id_15;
  assign id_8 = id_1;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_6,
      id_7,
      id_12,
      id_13,
      id_7,
      id_9,
      id_9,
      id_5,
      id_5,
      id_0,
      id_0,
      id_7
  );
  always @(*) @(posedge (id_10 - id_1)) $unsigned(id_8);
  ;
  wire [1 : id_1  ==  1 'b0] id_16;
endmodule
