// Seed: 2981613636
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd38,
    parameter id_8 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  output wire _id_8;
  inout wire id_7;
  output reg id_6;
  inout wire id_5;
  input wire _id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5,
      id_1,
      id_7,
      id_5,
      id_9,
      id_7
  );
  wire id_11;
  wire id_12;
  struct packed {
    logic [1 : 1] id_13;
    logic [id_4 : -1 'h0] id_14;
  } [-1 : id_8  ==  1] id_15;
  ;
  assign id_2[1] = id_15.id_13;
  wire id_16;
  wire id_17;
  always @(posedge id_16) id_6 = id_7;
endmodule
