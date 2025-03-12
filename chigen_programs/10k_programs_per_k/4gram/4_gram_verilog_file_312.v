// Seed: 2648687327
module module_0 #(
    parameter id_1  = 32'd35,
    parameter id_12 = 32'd22,
    parameter id_15 = 32'd40,
    parameter id_4  = 32'd68,
    parameter id_7  = 32'd43
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12
);
  input wire _id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  input wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wire _id_1;
  wire [id_12 : 1 'd0 ==?  1] id_13;
  wire [id_4 : id_1] id_14;
  wire [id_12 : id_7] _id_15;
  wire id_16;
  id_17 :
  assert property (@(posedge -1'b0) -1)
  else $clog2(29);
  ;
  assign id_2[id_15 : id_15] = id_13;
endmodule
module module_1 #(
    parameter id_10 = 32'd87,
    parameter id_2  = 32'd57
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  output wire id_1;
  localparam id_7 = 1'b0, id_8 = (1);
  wire id_9;
  logic [1 : id_2  ==  1  <=  1] _id_10;
  ;
  wire id_11;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_11,
      id_8,
      id_5,
      id_4,
      id_8,
      id_11,
      id_4,
      id_5,
      id_9,
      id_8
  );
  assign id_3[id_10==1] = (id_8);
endmodule
