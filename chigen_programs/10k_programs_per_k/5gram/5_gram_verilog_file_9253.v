// Seed: 4009321684
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_20;
  wand id_21;
  assign id_21 = 1;
  wire id_22;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd37,
    parameter id_4 = 32'd53,
    parameter id_6 = 32'd8
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7
);
  input logic [7:0] id_7;
  output wire _id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_5,
      id_3,
      id_2,
      id_5,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  input wire _id_4;
  input wire id_3;
  inout wire id_2;
  inout wire _id_1;
  id_8 :
  assert property (@(posedge id_8) id_2 == id_8)
  else $clog2(5);
  ;
  wire [(  -1 'b0 ==  1  ) : id_1  <<  id_4] id_9, id_10;
  assign id_6 = id_7;
  wire id_11;
  localparam id_12 = -1;
  logic [-1 : id_6] id_13;
  ;
endmodule
