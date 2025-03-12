// Seed: 360437792
module module_0 #(
    parameter id_2 = 32'd62
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  output wire id_1;
  logic [-1 : id_2] id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd66,
    parameter id_7 = 32'd84
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  input wire id_8;
  inout wire _id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire _id_2;
  output wire id_1;
  wire id_9;
  assign id_7 = id_2;
  module_0 modCall_1 (
      id_4,
      id_7
  );
  logic [1 : {  1  ,  id_7  }] id_10;
  localparam [id_2 : 1] id_11 = 1;
  always begin : LABEL_0
    id_6[-1] <= 1;
  end
endmodule
