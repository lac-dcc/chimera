// Seed: 3805944291
module module_0 #(
    parameter id_4 = 32'd68,
    parameter id_6 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  inout wire id_5;
  input wire _id_4;
  assign module_1.id_13 = 0;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire _id_6;
  ;
  logic id_7[id_4 : (  id_6  )];
  ;
endmodule
module module_1 #(
    parameter id_8 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9
);
  input wire id_9;
  inout wire _id_8;
  output logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output reg id_2;
  output wire id_1;
  assign id_8 = id_3;
  assign id_7[id_8] = 1;
  wire [-1 'd0 : 1 'b0] id_10;
  always begin : LABEL_0
    id_2 = id_8;
  end
  supply0 id_11, id_12, id_13;
  assign id_13 = -1;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_10,
      id_8,
      id_12
  );
  assign id_8 = id_5;
endmodule
