// Seed: 2573996813
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd43,
    parameter id_2  = 32'd0,
    parameter id_3  = 32'd50,
    parameter id_4  = 32'd21,
    parameter id_6  = 32'd85
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11
);
  inout wire id_11;
  inout wire _id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  input wire _id_6;
  input wire id_5;
  input wire _id_4;
  input wire _id_3;
  input wire _id_2;
  module_0 modCall_1 (
      id_11,
      id_8,
      id_11,
      id_11,
      id_1,
      id_5,
      id_8,
      id_8,
      id_11,
      id_11,
      id_8,
      id_11
  );
  input wire id_1;
  assign id_9[id_4] = 1 ? -1 : 1;
  logic [id_2  &&  -1 : -1] id_12;
  tri1 id_13;
  ;
  logic id_14;
  ;
  assign id_13 = -1;
  logic [id_10 : id_6  +  {  1  {  id_3  &&  id_10  }  }] id_15;
  reg id_16 = -1;
  logic id_17;
  logic id_18;
  initial begin : LABEL_0
    id_16 <= id_15;
    if (1) id_7[1+:1'h0] <= id_18;
    else id_12 <= 1;
  end
  logic id_19;
  ;
  assign id_19 = 1 ? id_1 : -1 ? -1 : id_16;
endmodule
