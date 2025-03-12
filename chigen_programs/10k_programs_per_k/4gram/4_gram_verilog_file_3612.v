// Seed: 2592867886
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  \id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ;
  parameter [-1 : 1] id_27 = 1;
  logic id_28;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_6
  );
  assign id_2[id_5] = id_11;
  assign id_2 = id_1;
endmodule
