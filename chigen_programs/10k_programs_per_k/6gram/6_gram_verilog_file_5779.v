// Seed: 2905402904
module module_0 #(
    parameter id_1 = 32'd38
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  parameter id_4 = 1;
  assign id_2 = id_3;
  logic id_5;
  ;
  assign id_5 = id_4[id_1];
  wire id_6;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd4,
    parameter id_4 = 32'd33,
    parameter id_6 = 32'd58,
    parameter id_7 = 32'd56,
    parameter id_8 = 32'd27
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    _id_7
);
  output wire _id_7;
  input wire _id_6;
  output logic [7:0] id_5;
  input wire _id_4;
  output wire id_3;
  inout wire _id_2;
  inout tri0 id_1;
  assign id_1 = 1;
  parameter id_8 = 1;
  assign id_5 = id_1;
  wire id_9;
  assign id_5[id_4] = 1 ? -1 : id_1;
  assign id_9 = $signed(id_8);
  ;
  wire [{  1  ,  id_8  ,  id_6  ,  id_4  ==  id_2  } : {  1  ,  id_4  }] id_10;
  logic id_11, id_12 = id_11 == 1'b0;
  logic [id_7 : id_8] id_13;
  wire  [-1 : -1 'b0] id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_14
  );
  always force id_1 = -1;
endmodule
