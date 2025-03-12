// Seed: 1293215621
module module_0 #(
    parameter id_4 = 32'd54
) (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  ;
  wire _id_4;
  wire [1 : id_4] id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd27,
    parameter id_3 = 32'd66
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input logic [7:0] id_8;
  output logic [7:0] id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  input wire _id_2;
  output wire id_1;
  wire id_9, id_10;
  assign id_7[1] = 1'b0;
  module_0 modCall_1 (
      id_9,
      id_4
  );
  assign id_7 = id_8[id_2];
  wire [id_3 : 1] id_11;
  parameter id_12 = (1);
endmodule
