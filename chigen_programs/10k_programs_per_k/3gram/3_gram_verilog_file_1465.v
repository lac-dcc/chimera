// Seed: 1693414710
module module_0 #(
    parameter id_19 = 32'd60
) (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    _id_19
);
  inout wire _id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [id_19 : 1] id_20;
  assign id_17 = id_19;
  parameter id_21 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd70,
    parameter id_4 = 32'd91
) (
    _id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire id_2;
  input wire _id_1;
  assign id_3[1] = id_2;
  localparam id_4 = -1;
  assign id_3 = id_3[id_4];
  tri \id_5 ;
  assign id_3[id_1] = \id_5 ;
  logic id_6;
  tri1  id_7 = 1'h0;
  assign \id_5 = id_1 == 1;
  module_0 modCall_1 (
      id_6,
      \id_5 ,
      \id_5 ,
      id_2,
      \id_5 ,
      \id_5 ,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      \id_5 ,
      \id_5 ,
      id_2,
      id_6,
      id_6,
      \id_5 ,
      id_6,
      id_4
  );
endmodule
