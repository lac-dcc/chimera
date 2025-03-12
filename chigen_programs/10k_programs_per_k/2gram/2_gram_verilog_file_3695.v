// Seed: 2696166330
module module_0 #(
    parameter id_10 = 32'd34,
    parameter id_11 = 32'd46,
    parameter id_18 = 32'd8,
    parameter id_2  = 32'd53,
    parameter id_20 = 32'd62,
    parameter id_24 = 32'd3,
    parameter id_28 = 32'd86,
    parameter id_34 = 32'd42
) (
    input wor id_0
);
  wire _id_2;
  wire [1  ==  1 : -1] id_3;
  wire  id_4  ,  id_5  ,  \id_6  ,  id_7  ,  id_8  ,  id_9  ,  _id_10  ,  _id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  _id_18  ,  id_19  ,  _id_20  ,  id_21  ,  id_22  ,  id_23  ,  _id_24  ,  id_25  ,  id_26  ,  id_27  ,  _id_28  ;
  logic id_29;
  struct packed {
    logic id_30;
    logic [id_28  +  {  1  ,  1 'b0 ,  {  -1  ,  ~  id_2  ,  id_24  }  } : id_18] id_31;
    logic id_32;
  } id_33;
  ;
  wire [id_10 : id_20] _id_34;
  wire id_35;
  ;
  wire id_36;
  assign id_33[id_11 :-1&&id_34] = id_0 == 1'b0;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output tri id_2,
    input supply0 id_3,
    output logic id_4,
    output wand id_5,
    input uwire id_6
);
  always_latch begin : LABEL_0
    id_4 <= 1'b0;
  end
  module_0 modCall_1 (id_3);
endmodule
