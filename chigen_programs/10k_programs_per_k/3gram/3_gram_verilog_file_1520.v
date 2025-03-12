// Seed: 1876076672
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd62,
    parameter id_19 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_6,
      id_4,
      id_7,
      id_2
  );
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10[-1 'h0 : -1], id_11;
  uwire  id_12  =  id_1  ,  id_13  =  1  ,  _id_14  =  -1  ,  id_15  =  -1 'b0 ,  id_16  =  1  ^  id_12  ,  id_17  =  -1  ,  id_18  =  id_16  ,  _id_19  =  id_16  ,  id_20  =  -1  ;
  assign id_3[id_19] = id_20 - (id_13);
  assign id_10 = id_6;
  wire id_21 = 1'd0;
  wand [id_14 : 1] id_22 = 1 & id_8 * id_22;
  parameter id_23 = -1;
  logic id_24;
endmodule
